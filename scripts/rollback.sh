
#!/bin/bash
DEPLOY=$1
kubectl rollout undo deployment/$DEPLOY
