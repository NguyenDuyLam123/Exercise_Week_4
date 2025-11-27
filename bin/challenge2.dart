import 'dart:isolate';
import 'dart:math';
import 'dart:async';

void worker(SendPort mainSendPort) async {
  final random = Random();
  final port = ReceivePort();

  // Gửi SendPort của worker về main
  mainSendPort.send(port.sendPort);

  // Worker chạy vòng lặp sinh số mỗi giây
  Timer.periodic(Duration(seconds: 1), (timer) {
    int value = random.nextInt(20) + 1;
    mainSendPort.send(value);
  });

  // Lắng nghe lệnh từ main
  await for (var msg in port) {
    if (msg == 'stop') {
      print("Worker: received stop → exiting...");
      Isolate.exit(); // Thoát isolate
    }
  }
}

void main() async {
  final receivePort = ReceivePort();
  await Isolate.spawn(worker, receivePort.sendPort);

  SendPort? workerSendPort;
  int sum = 0;

  await for (var msg in receivePort) {
    // Nhận SendPort từ worker
    if (msg is SendPort) {
      workerSendPort = msg;
      print("Main: connected to worker!");
      continue;
    }

    // Nhận số random
    int number = msg as int;
    sum += number;
    print("Main received: $number → Sum = $sum");

    // Khi tổng > 100 → dừng isolate
    if (sum > 100) {
      print("Main: Sum > 100 → sending stop...");
      workerSendPort?.send('stop');
      break;
    }
  }

  print("Main isolate finished.");
}
