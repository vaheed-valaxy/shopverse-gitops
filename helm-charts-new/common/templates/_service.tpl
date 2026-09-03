apiVersion: v1
kind: Service
metadata:
  name: {{ .Values.service.name }}
  # namespace: {{ .Values.namespace }}
  {{- with .Values.labels }}
  labels:
  {{- toYaml . | nindent 4 }}
  {{- end }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}             # 8080
      targetPort: {{ .Values.service.targetPort }} # 8080
      protocol: TCP
  {{- with .Values.labels }}
  selector:
    {{- toYaml . | nindent 4 }}
  {{- end }}
