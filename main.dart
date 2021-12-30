import 'dart:io';

void main(List<String> args) async {
  // Install UltroidCli
  var x = Process.runSync(
    'curl',
    [
      '-L',
      '-o',
      'ultroid',
      'https://github.com/BLUE-DEVIL1134/UltroidCli/releases/download/1.0.6/ultroid-linux',
      '&&',
      'ls'
    ],
    runInShell: true,
    workingDirectory: './',
  );
  stdout.write(x.stdout);
  stderr.write(x.stderr);

  // Give permissions to UltroidCli
  Process.runSync(
    'chmod',
    [
      'u+x',
      'ultroid',
    ],
    runInShell: true,
    workingDirectory: './',
  );
  
  // Start UltroidCli
  var init = Process.runSync(
    'ultroid',
    [
      'init',
    ],
    runInShell: true,
    workingDirectory: './',
//     mode: ProcessStartMode.inheritStdio,
  );
  stdout.write(init.stdout);
  stderr.write(init.stderr);
  
  // Install Dependencies
  Process.runSync(
    'pip',
    [
      'install', '-U', 'pip',
      '&&', 'pip', 'install', '--no-cache-dir', '-r', './TeamUltroid/requirements.txt',
      '&&', 'pip', 'install', 'av', '--no-binary', 'av'
    ],
    runInShell: true,
    workingDirectory: './',
  );
  
  // Start UltroidCli
  Process.start(
    'ultroid',
    [
      'heroku',
    ],
    runInShell: true,
    workingDirectory: './',
    mode: ProcessStartMode.inheritStdio,
  );
}
