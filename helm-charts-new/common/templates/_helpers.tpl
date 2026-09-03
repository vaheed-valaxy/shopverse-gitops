{{- define "shopverse.backend.image" -}}
{{ printf "%s/%s:%s" .Values.image.uri .Values.image.name .Values.image.version }}
{{- end }}

{{- define "shopverse.labels" }}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: Helm
{{- end }}


{{/*

=========================================================
OLD IMPLEMENTATION (without printf) — kept for reference
=========================================================
{{- define "shopverse.backend.image" -}}
{{ .Values.image.uri }}/{{ .Values.image.name }}:{{ .Values.image.version }}
{{- end }}

*/}}
