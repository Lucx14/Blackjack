### CRC cards to try to mdel the relationships between the different objects in Blackjack





```

### Game:

| Responsibility  |  Collaborator  |
|-----------------|----------------|
|Determine winner |  Player        |
|                 |  Dealer        |
|                 |                |
|                 |                |
|                 |                |
|                 |                |

### Hand ??? not sure if the hand itself should be an object

### Player:

| Responsibility  | Collaborator   |
|-----------------|----------------|
| Draw card       | Dealer         |
| record hand     |                |
|                 |                |




### Dealer:

| Responsibility  |  Collaborator  |
|-----------------|----------------|
|  Deal           | Deck           |
|  Draw card      |                |
|  record hand    |                |
|                 |                |
|                 |                |
|                 |                |
|                 |                |




### Deck:

| Responsibility  | Collaborator   |
|-----------------|----------------|
|  shuffle        | Card           |
|                 |                |
|                 |                |


### Card:

| Responsibility  | Collaborator   |
|-----------------|----------------|
| knows its value |                |
| knows its name  |                |
| print name      |                |



```
