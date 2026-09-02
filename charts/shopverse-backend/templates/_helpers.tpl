{{/*
Backend chart name.
*/}}
{{- define "shopverse-backend.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Backend fullname.
*/}}
{{- define "shopverse-backend.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name (include "shopverse-backend.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}


{{/*
Common labels.
*/}}
{{- define "shopverse-backend.labels" -}}
{{ include "shopverse-common.labels" . }}
app.kubernetes.io/component: backend
{{- end }}


{{/*
Selector labels.
*/}}
{{- define "shopverse-backend.selectorLabels" -}}
{{ include "shopverse-common.selectorLabels" . }}
app.kubernetes.io/component: backend
{{- end }}


{{/*
Service account name.
*/}}
{{- define "shopverse-backend.serviceAccountName" -}}
{{ include "shopverse-common.serviceAccountName" . }}
{{- end }}


{{/*
Container image.
*/}}
{{- define "shopverse-backend.image" -}}
{{ include "shopverse-common.image" . }}
{{- end }}
