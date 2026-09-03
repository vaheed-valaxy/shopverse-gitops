{{- define "common.deployment" }}

apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .Values.deployment.name }}                   # {{ .Release.Name }}
  # namespace: {{ .Values.namespace }}

  {{- with .Values.labels }}
  labels:
  {{- toYaml . | nindent 4 }}
  {{- end }}
spec:
  {{- if not .Values.autoscaling.enabled }}
  replicas: {{ .Values.deployment.replicas | default 1 }}
  {{- end }}
  selector:
    {{- with .Values.labels }}
    matchLabels:
    {{- toYaml . | nindent 6 }}
    {{- end }}
  template:
    metadata:
      {{- with .Values.labels }}
      labels:
      {{- toYaml . | nindent 8 }}
      {{- end }}

      {{- with .Values.annotations }}
      {{- if and .enabled (or .enable_checksum .values) }}
      annotations:
      {{- if .enable_checksum }}
        {{/* checksum/config: {{ include (print $.Template.BasePath "/" .checksum_file) $ | sha256sum }} */}}
        checksum/config: {{ include "common.configmap" $ | sha256sum }}
      {{- end }}
      {{- with .values }}
      {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- end }} 
      {{- end }}
    spec:
      {{- with .Values.imagePullSecrets }}
      {{- if and .enabled .values }}
      imagePullSecrets:
      {{- toYaml .values | nindent 8 }}
      {{- end }}
      {{- end }}
      
      {{- with .Values.serviceAccount }}
      {{- if and .create .values }}
      serviceAccountName: {{ .values.name }}    # {{ .Values.serviceAccount.values.name }}
      {{- else }}
      serviceAccountName: default
      {{- end }}
      {{- end }}
      
      {{- with .Values.podSecurityContext }}
      {{- if and .enabled .values }}
      securityContext:
      {{- toYaml .values | nindent 8 }}
      {{- end }}
      {{- end }}
      
      terminationGracePeriodSeconds: {{ .Values.terminationGracePeriodSeconds }}
      containers:
        - name: {{ .Values.containerName }}  
          image: '{{ include "shopverse.backend.image" . }}'
          imagePullPolicy: {{ .Values.imagePullPolicy | default "IfNotPresent" }}   # Always # IfNotPresent 
          ports:
            - containerPort: {{ .Values.service.targetPort }} # 8080
              protocol: TCP
              
          {{- with .Values.containerSecurityContext }}
          {{- if and .enabled .values }}
          securityContext:
          {{- toYaml .values | nindent 12 }}
          {{- end }}
          {{- end }}

          {{- with .Values.envFrom }}
          {{- if and .enabled .values }}
          envFrom:
          {{- toYaml .values | nindent 12 }}
          {{- end }}
          {{- end }}

          {{- with .Values.env }}          
          {{- if and .enabled .values }}
          env:
          {{- toYaml .values | nindent 12 }}
          {{- end }}
          {{- end }}
          
          {{- with .Values.resources }}  
          {{- if and .enabled .values }}    
          resources:
          {{- toYaml .values | nindent 12 }}
          {{- end }}
          {{- end }}

          {{- with .Values.startupProbe }}
          {{- if and .enabled .values }}
          startupProbe:
          {{- toYaml .values | nindent 12 }}
          {{- end }}
          {{- end }}

          {{- with .Values.readinessProbe }}
          {{- if and .enabled .values }}
          readinessProbe:
          {{- toYaml .values | nindent 12 }}
          {{- end }}
          {{- end }}

          {{- with .Values.livenessProbe }}
          {{- if and .enabled .values }}
          livenessProbe:
          {{- toYaml .values | nindent 12 }}
          {{- end }}
          {{- end }}

          {{- with .Values.volumeMounts }}
          {{- if and .enabled .values }}
          volumeMounts:
          {{- toYaml .values | nindent 12 }}
          {{- end }}
          {{- end }}
          
      {{- with .Values.volumes }}
      {{- if and .enabled .values }}    
      volumes:
      {{- toYaml .values | nindent 8 }}
      {{- end }}
      {{- end }}

      {{- with .Values.nodeSelector }}
      {{- if and .enabled .values }}
      nodeSelector:
      {{- toYaml .values | nindent 8 }}
      {{- end }}
      {{- end }}

      {{- with .Values.affinity }}
      {{- if and .enabled .values }}
      affinity:
      {{- toYaml .values | nindent 8 }}
      {{- end }}
      {{- end }}

      {{- with .Values.tolerations }}
      {{- if and .enabled .values }}
      tolerations:
      {{- toYaml .values | nindent 8 }}
      {{- end }}
      {{- end }}

      {{- with .Values.topologySpreadConstraints }}
      {{- if and .enabled .values }}
      topologySpreadConstraints:
      {{- toYaml .values | nindent 8 }}
      {{- end }}
      {{- end }}

{{- end }}
