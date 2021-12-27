######
Etapa um: anexar etiqueta ao nó

Execute kubectl get nodes para obter os nomes dos nós do seu cluster. Escolha aquele ao qual deseja adicionar um rótulo e, em seguida, execute kubectl label nodes <node-name> <label-key>=<label-value>

https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/