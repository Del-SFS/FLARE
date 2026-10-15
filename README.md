# 📱 FLARE (Folder-based Local Application & Resourse Executor)

O **FLARE** é um Launcher de App e jogos portáteis 100% offline para Windows, focado em simplicidade e organização baseada em pastas.

## ❓ Sobre o projeto

esse projeto está a ser desenvolvido em **C# (.NET)** com o obijetivo de centralizar e execultar programas de forma práica.

A versão atual é uma **versão console (linha de comando)** criada para estruturar e validar toda a Lógica de manipulação de ficheiros (`System.IO`) e inicialização de prosessos (`System.Diagnostics`). O próximo passo será a criação de uma UI (interface grafica)

## 🕹️ Como Funciona a estrutura de pastas

O FLARE funciona detetando automaticamente as subpastas dentro do Diretório `Apps/`.

### Exemplo de estrutura:

```md
FLARE/
+- FLARE.exe
|
+- Apps/
| +- AppExemplo/
| |  +-APP.exe
| |
| +- JogoExemplo/
     +-APP.exe
```

## 📝 Regras de Funcionamento:

1. O Launcher procura por subbpastas dentro da pasta `Apps/`.

2. O exe do programa ou jogo **deve chamar-se obrigatorariamente** `APP.exe`.

3. O launcher define o `WorkingDiretorectory` para a pasta especifica do app, garantindo que o programa encontre as suas Próprias dependencias e ficheiros locais.

## 🚀 Como Executar

1. Executar o execultavel do FLARE (`FLARE.exe`)

2. se vc já tiver execultado o FLARE ele vai abrir normalmente mas se não vai criar a pasta Apps/

## 💻 Tecnologias Usadas

- Linguagem: C# (CSharp)
- Manipulação de ficheiros: `System.IO`
- Executação de Programas: `System.Diagnostics`
- Interface futura: `Avalonia UI`
