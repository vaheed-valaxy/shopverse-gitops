{{- if .Values.configmap.enabled }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Values.configmap.name }}                         # shopverse-config
  # namespace: {{ .Values.namespace }}                       # shopverse-dev
  {{- with .Values.labels }}
  labels:
  {{- toYaml . | nindent 4 }}
  {{- end }}
{{- if .Values.configmap.values }}
data:
  {{- range $key, $value := .Values.configmap.values }}
  {{ $key }}: {{ $value | quote }}
  {{- end }}
{{- end }}
{{- end }}
