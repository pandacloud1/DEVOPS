# 🚀 Deploy Nginx App using Helm & Helm Charts

## 📌 Steps
### 1. Create a Helm Chart
```bash
helm create myapp
````

### 2. Modify `values.yaml`
Update the **image** and **service** details inside `myapp/values.yaml`:

```yaml
image:
  repository: nginx
  tag: latest
  pullPolicy: IfNotPresent

service:
  type: NodePort
  port: 80
```

### 3. Modify `deployment.yaml`
Update `myapp/templates/deployment.yaml`:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .Release.Name }}-nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
          ports:
            - containerPort: 80
```

### 4. Modify `service.yaml`
Update `myapp/templates/service.yaml`:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: {{ .Release.Name }}-nginx
spec:
  type: {{ .Values.service.type }}
  selector:
    app: nginx
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
      nodePort: 30080  # Change this if needed
```

### 5. Deploy the App Using Helm
```bash
helm install my-nginx myapp/
```

### 6. Access the Application
Run the following commands to get the service URL:

```bash
export NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services my-nginx-nginx)
export IP=$(curl ifconfig.me)
echo http://$IP:$NODE_PORT
```

Access your **Nginx application** in your browser at:
```
http://<Public-IP>:<NodePort>
```
