## HRadioButton / VRadioButton
Each node contains two horizontal/vertical buttons that can't be both selected, and allow "none" as an option.

- **Allow None**: Lets you deselect all options and passes the String "none" through the choice() signal.
- **Disable Active Choice**: Prevents the current selection from being re-selected.
- **Choices**: Changes the text on buttons (in-game) and the passed String in the choice() signal.

The button text and the passed String are the same for simplicity, but can be decoupled if you know what you're doing.

Adding more choices is possible, but not natively supported. You can add more buttons, and adjust the "match option" statement accordingly. It is ultimately up to you how more than 2 buttons should be implemented. Keep "allow none" on if you have more than 2 options.
