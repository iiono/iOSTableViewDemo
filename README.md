iOSTableViewDemo
================

A iOS project that demonstrates different ways of implementing a TableView based application. 

/****************************************************************************************/
Demonstration Descriptions
/****************************************************************************************/

SimpleDemo
  Text can be entered at the text field in the top of the app. On hitting the "+" button, 
  a cell is created in the table view using the text from the text field

/****************************************************************************************/
Setup Instructions
/****************************************************************************************/
To change which demonstration the app loads:
  open the DemoAppDelegate.m file
    navigate to the "applicationdidFinishLaunchingWithOptions"
      alter the "demoToRun" variable to select different demonstrations
        demoToRun = 1 : loads the SimpleDemo demonstration
        demoToRun = 2 : loads the AdvancedDemo demonstration (currently un-implemented)