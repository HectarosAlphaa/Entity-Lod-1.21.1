@echo off
setlocal
set "APP_HOME=%~dp0"
set "APP_BASE_NAME=%~n0"
set "WRAPPER_JAR=%APP_HOME%gradle\wrapper\gradle-wrapper.jar"
set "WRAPPER_URL=https://raw.githubusercontent.com/gradle/gradle/v8.10.2/gradle/wrapper/gradle-wrapper.jar"

if not exist "%WRAPPER_JAR%" (
  echo Gradle Wrapper JAR ausente. Baixando arquivo oficial do Gradle...
  powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference='Stop'; Invoke-WebRequest -UseBasicParsing -Uri '%WRAPPER_URL%' -OutFile '%WRAPPER_JAR%'"
  if errorlevel 1 (
    echo ERRO: nao foi possivel baixar gradle-wrapper.jar. Verifique a conexao com a internet.
    exit /b 1
  )
)

if not exist "%WRAPPER_JAR%" (
  echo ERRO: gradle-wrapper.jar nao foi encontrado em "%WRAPPER_JAR%".
  exit /b 1
)

if defined JAVA_HOME (
  set "JAVA_EXE=%JAVA_HOME%\bin\java.exe"
) else (
  set "JAVA_EXE=java"
)

"%JAVA_EXE%" -Dorg.gradle.appname=%APP_BASE_NAME% -classpath "%WRAPPER_JAR%" org.gradle.wrapper.GradleWrapperMain %*
exit /b %ERRORLEVEL%
