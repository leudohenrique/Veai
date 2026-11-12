# VêAí — demonstração Android

Este é o projeto inicial visual do VêAí, feito em Flutter. Ele foi preparado para que o APK de demonstração possa ser compilado gratuitamente na nuvem usando GitHub Actions, sem instalar Flutter no celular.

## O que esta demonstração tem
- Tela inicial com vídeos fictícios.
- Pesquisa local dos vídeos de exemplo.
- Tela de assistir com player ilustrativo.
- Curtida e comentários apenas durante a sessão de demonstração.
- Perfil demonstrativo e formulário de entrada local.
- Publicação bloqueada para visitante, conforme a ideia do VêAí.
- Navegação entre Início, Explorar, Publicar e Perfil.

## Limitações importantes
Esta ainda NÃO é uma rede social pronta. Não há conta real, banco de dados, upload de vídeos, reprodução de vídeos hospedados, anúncios, inscrições persistentes ou painel administrativo funcional. O login é apenas uma simulação local e não deve ser usado com senha verdadeira. Essas funções serão implementadas e testadas nas próximas etapas.

## Como gerar o APK pelo celular, sem instalar programas

1. No navegador do celular, entre em https://github.com/ e crie uma conta gratuita ou entre na sua conta.
2. Crie um repositório novo chamado `veai-app`. Pode deixar como **Private**.
3. Extraia este ZIP no celular usando o gerenciador de arquivos. É importante enviar os arquivos e pastas que estão dentro da pasta `veai_flutter_starter`, não enviar apenas o ZIP.
4. No repositório do GitHub, use **Add file → Upload files** e envie os arquivos do projeto, incluindo a pasta oculta `.github/workflows` e o arquivo `lib/main.dart`. Se o celular esconder pastas iniciadas por ponto, ative a opção para mostrar arquivos ocultos.
5. Confirme em **Commit changes**. O GitHub iniciará a compilação automaticamente.
6. Abra a aba **Actions**, entre na execução chamada **Gerar APK Android**, espere ficar verde/concluída e abra o item `veai-apk-demo` em **Artifacts** para baixar o APK.
7. Extraia o arquivo baixado, toque em `app-release.apk` e autorize a instalação pelo navegador/gerenciador de arquivos quando o Android pedir.

Se a compilação falhar, abra a execução em **Actions**, copie a mensagem de erro e envie aqui para eu orientar a correção.

## Se a compilação não começar
Na aba **Actions**, talvez seja necessário habilitar workflows para o repositório. Depois, abra **Gerar APK Android** e toque em **Run workflow**.

## Desenvolvimento futuro
A próxima etapa será substituir os dados fictícios por Firebase Authentication e Cloud Firestore, integrar armazenamento/streaming de vídeos, regras de segurança, moderação, anúncios e painel administrativo protegido. Serviços de vídeo e anúncios podem gerar custos quando o app crescer.
