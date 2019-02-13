import 'dart:html';

void main() {
  final ButtonElement button = querySelector('button');
  final InputElement input = querySelector('input');

  button.onClick
    .take(4)
    .where((event) => input.value == 'banaa')
    .listen((event) => print('You got it'),
           onDone: () => print('Nope, bad guesses.'));
  
  
}

/* html:

<h4>Guess the Word!</h4>
<input/>
<button>Click me!</button>

*/