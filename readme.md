# DeerTears' Godot Control Node Extensions

This repository contains all of the experiments and extensions I've made for Control nodes in Godot.

Quick Navigation:
- [Folder Guide](#folder-guide)
- [Containers](#containers)
	- [PercentMargin](#percentmargin)
		- [PercentMargin Variables](#percentmargin-variables)
		- [PercentMargin Notes](#percentmargin-notes)
		- [PercentMargin Issues](#percentmargin-issues)
- [Nodes](#nodes)
	- [RadioButton (H/V)](#RadioButton-hv) <!-- please work with a slash in there thanks -->
		- [RadioButton Variables](#RadioButton-variables)
		- [RadioButton Notes](#RadioButton-notes)
		- [RadioButton Issues](#RadioButton-issues)
	- [DiagonalContainer](#DiagonalContainer)
		- [DiagonalContainer Variables](#DiagonalContainer-variables)
		- [DiagonalContainer Issues](#DiagonalContainer-issues)

## Folder Guide

**examples** - This folder demonstrates using my custom extensions in different scenarios. This folder contains "example_selection.tscn", the default scene for this project, which lets you navigate between examples.

Individual examples include:

- **cardstack**: A mock cardgame, showcasing the DiagonalContainer.
- **team_select_screen**: A team select screen for a multiplayer game, showcasing the HRadioButton.
- **webpage**: A mock webpage made in Godot, attempting to showcase the HPercentSeparator.

**extension_scenes** - A folder containing subfolders with each of my custom nodes. This folder may be renamed in the future since not all of these Extensions are technically "scenes" anymore.

## Containers

These extensions require no .tscn file, their names can be searched in the Add Node menu and all the functionality will be present, without the need to connect any signals.

A quick overview of all containers:
- PercentMargin
- RadioButton (H/V)
- DiagonalContainer

### PercentMargin
**A simpler, faster MarginContainer for CSS nerds.**  
PercentMargin gives you two sliders to adjust the horizontal and vertical margins based on a percentage rather than an absolute pixel value. The size of the children will adjust appropriately as this container gets resized.

#### PercentMargin Variables

**Horizontal Margin** - A slider that changes the multiplier of the children's horizontal margin. The slider goes from 0.000 to 1.000 in steps of 0.001. Use individual margins for more precision if needed.

**Vertical Margin** - A slider that changes the multiplier of the children's vertical margin. The slider goes from 0.000 to 1.000 in steps of 0.001. Use individual margins for more precision if needed.

**Individual Margins** - A dictionary that allows each margin multiplier: `left`, `right`, `top`, `bottom`, to be adjusted as needed. The changes made in this dictionary will not take effect until "Use Individual Margins" is checked. **I reccomend you close this dictionary once you are finished adjusting its values.** The dictionary values will not accurately update if "Use Individual Margins" is unchecked and the sliders are used once again.

**Use Individual Margins** - A checkbox that toggles which numbers the PercentMargin uses as the margins for its children. Checking this box will use the numbers kept in the Individual Margins dictionary, while unchecking this box will refer to the slider values. Keeping this box checked will prevent the sliders from updating the Individual Margins.

#### PercentMargin Notes

As a general workflow, it is recommended you use the Horizontal and Vertical sliders first, open the dictionary, click "Use Individual Margins", adjust the dictionary as needed, then close the dictionary when done. If you need to use the sliders again, uncheck "Use Individual Margins".

Although adjusting the margin sliders after adjusting Individual Margins will cause Individual Margins to update, the Individual Margin numbers will not represent their in-code values until the Dictionary is closed and re-opened (or the inspector window switches to another node and back). Clicking on the `Dictionary (size 4)` in the inspector twice to close and open the contents. It is my hope that the "Use Individual Margins" toggle is sufficient for having control over these variables without losing information in the process.

#### PercentMargin Issues

The inclusion of the "Use Individual Margins" is a hacky solution to mask the fact that the "Individual Margins" Dictionary isn't automatically updated when the two sliders are used. I attempted to make a system where "Use Individual Margins" unchecked itself whenever the sliders were moved for the sake of usability, but this created more confusion because this checkbox also could not be updated (without refreshing the window) to reflect the real state of the variables. I would love to have help figuring out a good solution for this problem.

The current numbers can be reflected in the inspector by clicking on the Dictionary header twice to refresh the contents. Alternatively, adjusting the individual margins after either slider is used will still refer to the numbers present in the individual margins.

## Nodes

All these nodes require instancing a .tscn file to function because they rely on pre-determined child nodes.

### RadioButton (H/V)
**A stronger, more-customizable CheckButton-style node that uses two button nodes instead of a single modified button.**  
RadioButton comes in 2 forms, HRadioButton and VRadioButton. For each node, the buttons can be toggled on or off in relation to eachother, so that only one button is active at a time. This node emits a `choice()` signal that can be connected to find the option that was selected.

This node does not natively support more than 2 choices, but it provides some stronger groundwork to allow for it.

#### RadioButton Variables

**Allow None** - Lets users deselect their current choice and to go back to a neutral state. This passes the string "none" in the `choice()` signal.

**Disable Current Choice** - Prevents users from re-toggling the choice they just made, forcing them to press the opposite button instead.

**Choices** - An array that contains the text and passed string of each button respectively. This is where the button text and signals should be edited.

#### RadioButton Notes

Savvy coders can use this node as the basis for providing more options passed through the custom `choice()` signal.

#### RadioButton Issues

- Choices

The signal and text are unified for simplicity, but this does not consider buttons that do not wish to have text displayed at all. This behaviour could be changed in the future.

- Disable Current Choice

Pressing a button does not automatically move focus over to the other button, so keyboard/controller users will have their focus placed on top of a disabled button. This behaviour will be changed in the future.

### DiagonalContainer
**A silly container for stacking control nodes diagonally.**  
Made as a joke, and justified after the fact, my goal is to create an HBox/VBox-type container that stacks control nodes diagonally. This node was made more with artists in mind, rather than UX designers.

#### DiagonalContainer Variables

**Left to Right** - When checked, the container arranges the children 0+ from left to right within this container's bounds. When unchecked, the children are arranged from right to left.

**Top to Bottom** - When checked, the container arranges the children 0+ from top to bottom within this container's bounds. When unchecked, the children are arranged from bottom to top.

#### DiagonalContainer Issues

The children are by default arranged by their upper-left corner, which is less than ideal for some use cases.

The arranging bounds try to account for the cumulative size of children when compared against this container's rect_size, but the children positioning always stops short of the direction it intended to go towards. I will have to do research to figure out how other arranging containers handle their children sizes in relation to container size, because this container almost gets it right.