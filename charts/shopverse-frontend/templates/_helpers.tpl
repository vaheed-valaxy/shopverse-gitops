{{/*
Frontend chart name.
*/}}
{{- define "shopverse-frontend.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Frontend fullname.
*/}}
{{- define "shopverse-frontend.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name (include "shopverse-frontend.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}


{{/*
Common labels.
*/}}
{{- define "shopverse-frontend.labels" -}}
{{ include "shopverse-common.labels" . }}
app.kubernetes.io/component: frontend
{{- end }}


{{/*
Selector labels.
*/}}
{{- define "shopverse-frontend.selectorLabels" -}}
{{ include "shopverse-common.selectorLabels" . }}
app.kubernetes.io/component: frontend
{{- end }}


{{/*
Service account name.
*/}}
{{- define "shopverse-frontend.serviceAccountName" -}}
{{ include "shopverse-common.serviceAccountName" . }}
{{- end }}


{{/*
Container image.
*/}}
{{- define "shopverse-frontend.image" -}}
{{ include "shopverse-common.image" . }}
{{- end }}
