# Number Theory: Addition

In this lab, you’ve learned about One Hot and Binary state machines and how to build them.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Name
Sydney Hurst
## Summary
In this lab, we learned how to implement both binary and onehot coding into a working, functioning assignment. While having distincly different coding implementations, the overall structure of both felt extremely similar while creating them. The resulting assignmnet yielded a board that had varying states that depended on the given table from the assignment description. The onehot and binary had different approaches, yet ended up in a similar structure that held similar board yields

## Lab Questions

### Compare and contrast One Hot and Binary encodings
One Hot encodings use significantly more flip flops but are generally easier/simpler whereas binary encodings have a lot less flip flips but are a decent amount more complex and slower 

### Which method did your team find easier, and why?
I felt onehot was more direct to implement, as the coding felt easier to configure from the given table from the lab assignment. The coding was nearly 1:1 of the table given, with it showing the input value and states that correlate to given states. Creating the k-maps for binary felt slightly more involved, though not 

### In what conditions would you have to use one over the other? Think about resource utilization on the FPGA.
When a simpler logic and higher speed is desired, and there is room/resources to take up many flip flops, a one hot encoding can be used. but if resources/space for many flip flops are limited, or if simple code isnt as much a worry, Binary encoding can be used
