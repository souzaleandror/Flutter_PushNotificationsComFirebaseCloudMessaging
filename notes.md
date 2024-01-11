#### 11/01/2024

Curso de Flutter: Push Notifications com Firebase Cloud Messaging

```
java -jar server.jar  
```

@01-Introdução ao Firebase Cloud Messaging 

@@01
Apresentação

[00:00] Leonardo Marinho: Bom, pessoal, tudo bem? Eu sou Leonardo Marinho, sou instrutor Flutter da Alura. Esse que está aparecendo aqui, bonito, é o Kako, ele também é instrutor Flutter na Alura. Nesse curso basicamente vamos trabalhar com push notifications, ou seja, notificações nos aplicativos Flutter.
[00:18] Nesse curso vamos ver muita coisa bacana, vamos aprender vários conceitos com relação aos eventos de push, como disparamos o push, como monitoramos a forma como o usuário recebeu, abriu, foi exibida a coisa para ele. Vai ser muito bacana. Então não vou ficar falando, vou mostrar na prática, vamos mostrar na prática o que vamos fazer de fato no curso. Kako, mostra aí na prática para nós.

[00:42] Kako: Perfeito. Vai ser mais ou menos essa a nossa dinâmica, ele vai nos explicar e eu vou mostrar para vocês. Eu vou baixar aqui uma notificação, o nosso celular vai receber uma notificação aqui - já viu no nosso emulador? Apareceu uma imagem e você recebeu uma notificação no seu telefone.

[01:03] "Mega promoção: Dev-MeetUPS está dando 50% de desconto, mas só agora". Se você clicar, ele abre a aplicação para você.

[01:14] Leonardo Marinho: E tem o cupom de desconto. Essa modal de mensagem, o texto dela vem completamente daquela notificação de push, ela é uma modal genérica, esse texto não está dentro do aplicativo. Então nós já conseguimos nos comunicar com a aplicação mostrando dados, personalizando de uma maneira bem bacana.

[01:31] Esse é o primeiro ponto. Só para contextualizar, vamos trabalhar com uma aplicação chamada Dev Meetups, que basicamente é uma aplicação de eventos de tecnologia, nós temos a parte de API, que é o servidor, e temos a parte de aplicativo móvel, e elas se comunicam.

[01:48] Kako: Perfeito. Então nós vamos brincar com o servidor próprio que vocês vão receber, vocês vão brincar aqui, ele tem evento, onde você pode criar os eventos, eles vão aparecer na sua aplicação.

[01:58] Tem o Flutter Meetups, tem as mensagens que você pode mandar diretamente para os seus usuários, posso vir aqui e mandar uma notificação agora, se eu quiser.

[02:06] Tem os dispositivos disponíveis aqui, dos nossos Dev Meetups, que estão conectados com esse servidor. E não só isso, pode contar, Léo conta para eles.

[02:18] Leonardo Marinho: Também abordamos uma parte super legal do Flutter, que é o Flutter web. Como mandamos notificações push para a web? Nós vamos trabalhar com isso também no curso.

[02:30] Kako: Perfeito.

[02:30] Leonardo Marinho: Então, galera, é isso. Nós esperamos vocês aqui conosco. Esse curso foi pensado com muito carinho, foi trabalhado com muito carinho, detalhado cada pequena coisa de notificações, para você sair daqui completamente preparado ou preparada para poder desenvolver isso em larga escala.

[02:48] Kako: Ótimo, eu estou muito empolgado para esse curso.

[02:51] Leonardo Marinho: Eu também estou. Esse formato de curso, vale lembrar, é o formato de curso em dupla, então eu e o Kako, nós temos um dinamismo em todas as aulas, nós vamos te acompanhar ao longo de todo o curso.

[03:02] Kako: Fechou então. Vejo vocês na próxima aula.

[03:05] Leonardo Marinho: Até lá. Tchau, tchau.

@@02
Orientações iniciais e organização do curso

Pré-requisito
Neste curso, assumimos que você conhece todo conteúdo apresentado no curso Fundamentos de Flutter: Crie o seu primeiro App.

Caso você não tenha feito o curso, mas acredita que possa começar a partir daqui, fique à vontade para continuar. Porém, se neste curso houver algum conteúdo que não foi explicado com tanta atenção, muito provavelmente ele já foi explicado em um curso anterior. De qualquer forma, você pode entrar em contato conosco por meio do fórum.

Como o curso está organizado
Este curso é classificado como intermediário, e isso significa que alguns exercícios não serão tão detalhados como em um curso básico. Mas não se preocupe, pois todas as orientações necessárias serão apresentadas.

Se preferir executar as etapas junto com o instrutor, fique à vontade. Porém, saiba que daremos todo auxílio necessário nos exercícios. Recomendamos fortemente primeiro assistir a aula com atenção para depois praticar :)

https://cursos.alura.com.br/course/flutter-fundamentos

@@03
Preparando o ambiente

Neste curso, utilizamos o projeto web e app Flutter, e você pode baixá-los a partir dos links abaixo:
Aplicação web
App Flutter
Inicialização da aplicação web
Ao baixar a aplicação web, extraia o arquivo server.jar em um local de sua preferência. Então, acesse via prompt de comando ou terminal o local onde o arquivo foi extraído.

Execute o arquivo usando o comando java -jar server.jar. Após a execução, caso não haja problemas, deve ser apresentada uma mensagem indicando que a aplicação foi inicializada e também a porta onde ela está disponível.

Se apresentar algum problema na execução, verifique a mensagem e tente identificar o problema. Os problemas mais comuns são:

Versão do Java: aplicação com a versão do Java a partir da 8.
Porta de execução não disponível: pode haver uma aplicação usando a porta 8080. Você pode derrubar a outra aplicação ou mudar a porta de execução usando a instrução java -jar server.jar --server.port=8081.
Você pode verificar mais detalhes da aplicação web a partir do readme do repositório do projeto.

App Flutter
Para o app Flutter, extraia o arquivo e abra no Android Studio (ou editor/IDE que preferir), baixe o arquivo do google-services.json no Firebase console e adicione-o na pasta Android/App.

Ao projeto no Firebase, precisamos adicionar um app com o pacote br.com.alura.meetups.
Feito isso, modifique o endereço da URL base dentro do arquivo web.dart pelo endereço IP da sua máquina, por exemplo http://seu_ip/api/. Pelo prompt, você pode buscar usando o comando ipconfig e pelo terminal ifconfig.

Por fim, teste o app e confira se funciona como esperado.

https://github.com/alura-cursos/dev-meetups-api/archive/runnable.zip

https://github.com/alura-cursos/flutter-notifications/archive/refs/heads/start.zip

https://github.com/alura-cursos/dev-meetups-api

@@04
Inicializando a aplicação web

[00:00] Leonardo Marinho: Fala, pessoal. Hoje eu trouxe o Kako para estudarmos uma coisa super legal: como nós vamos começar a falar push notifications e por onde o curso será guiado. A primeira coisa que precisamos ver aqui é parte do servidor das notificações, que vai gerenciar toda a notificação para podermos trabalhar no fluxo de mandar a notificação para o aplicativo.
[00:21] Também cadastrar essas notificações e se comunicar com o Firebase Cloud Messaging, mas uma série de coisas legais que vamos usar ao longo do curso. Para isso, a primeira coisa é baixar a aplicação.

[00:33] No GitHub da Alura tem o "alura-cursos/dev-meetups-api". O que é isso exatamente? Nós consumimos dados de um aplicativo de meetup de programação, ou seja, eventos, palestras de programação. Esse servidor tem uma API específica para conseguirmos cadastrar os eventos, salvar tokens que precisamos para mandar notificações de push e uma série de coisas legais que vamos ver ao longo do curso.

[00:59] Então a primeira coisa é baixar esse servidor para a sua máquina. Kako, mostra para a galera.

[01:05] Kako: Então, galera, seguinte, estamos aqui no GitHub da Alura e tem o "dev-meetups-api", nós vamos passar esse link para vocês mais tarde. Você, aqui no GitHub, vai ter todos os dados que você precisa e, aqui embaixo, tem um tópico chamado "Como baixar".

[01:20] Basta clicar nesse link, que você vai baixar um arquivo ZIP. Abra o arquivo ZIP, deszip ele - vocês já estão cientes de como funciona isso, não é? Uma vez que você baixou o nosso API runnable, nós abrimos ele na pasta.

[01:39] Como fazemos? Se você quer saber como executar, nunca mexeu com um arquivo JAR, um arquivo Java, tem todo um tutorial aqui no GitHub, mas vamos fazer mais rápido para vocês, que vocês já estão cientes de como funciona. Então aqui, vou abrir a nossa pasta do runnable, e eu vou escrever na linha de endereço "cmd" para abrir o command prompt já direto na nossa pasta.

[02:04] O que eu faço? Eu já venho aqui e escrevo java -jar server.jar. Dou um "Enter" e ele vai começar a rodar o nosso servidor, vai começar a ligar cada um dos parâmetros, já está tudo configurado para o Firebase mais tarde. Abriu, ligou, está falando aqui que o nosso tomcat está aberto na porta 8080.

[02:26] Beleza, vamos dar uma olhada lá, como é que funciona? Vou abrir a nossa nova guia no navegador e abrir "localhost". Se quiser comentar alguma coisa, Léo, vai lá.

[02:39] Leonardo Marinho: Se você reparar bem, tomcat é Java, a aplicação obviamente está rodando em cima do Java usando um framework chamado Spring Boot, que, só a dado de curiosidade, não vai interferir em nada aqui no nosso curso.

[02:52] Kako: Então eu vou abrir o "localhost" e vocês têm agora a visão do nosso Dev Meetups, essa organização dos eventos.

[03:02] Leonardo Marinho: Temos três partes na tela. A primeira é eventos, onde vamos efetivamente cadastrar eventos e gerenciar os eventos.

[03:09] Esses dados vão ficar em um banco de dados local, que está na máquina, vai ficar na pasta do Dev Meetups, o arquivo vai gerar a pasta, a databases, então esses dados vão ficar locais, salvos nesse banco de dados. Temos também uma parte que é de mensagens.

[03:24] Esse mensagens é onde nós vamos configurar a integração com o Firebase Cloud Messaging para podermos enviar mensagens de push para os dispositivos conectados. E, por último, mas não menos importante, tem dispositivos.

[03:37] Que quando o Firebase Cloud Messaging estiver configurado nas nossas aplicações Flutter, nas nossa aplicação Flutter, o Flutter vai mandar para essa aplicação desktop o token de conexão com o Firebase Cloud Messaging, que é para conseguirmos mandar as notificações diretamente para os dispositivos móveis. Então basicamente a aplicação web é isso.

[03:56] Kako: Perfeito. Agora vocês já entendem como funciona a aplicação web e tal, como vamos fazer. Então, na próxima aula, vamos aprender o que? A conectar o nosso aplicativo em Flutter com esse servidor que nós abrimos, para pegar os dados.

@@05
Configurando o app Android

[00:00] Leonardo Marinho: Continuando então com a nossa série, estudando a parte de push notification, no último vídeo, configuramos o servidor web. Agora temos a aplicação local na nossa máquina, rodando com o banco de dados e dando todas as opções para podermos cadastrar um novo Meetup.
[00:14] Mas não tem aplicativo para recebermos notificação. Agora é a hora de trabalharmos em cima desse aplicativo para recebermos as notificações. Como vamos fazer isso? O Kako vai mostrar como podemos baixar esse aplicativo e rodar no emulador.

[00:31] Daí para frente vamos começar a trabalhar para poder comunicar esse aplicativo com a aplicação web do Dev Meetup para podermos enviar dado, receber dado e começar a integração, que daqui a pouco você verá que vai virar uma notificação bem legal. Então Kako, mostra para galera como podemos baixar e configurar o aplicativo.

[00:48] Kako: É o seguinte: vocês vão receber o link, na, do GitHub. Vocês vão receber já com a aplicação para vocês baixarem, mas se vocês quiserem acessar o GitHub para dar uma lida, nós temos tudo aqui, o nosso read me de como funciona o projeto, o que vocês precisam saber.

[01:07] Uma vez que você baixou o seu projeto, você vai abrir ele no seu Android Studio, IntelliJ, VS Code, o que você estiver usando, e vamos começar a fazer algumas alterações aqui. Se baixamos o projeto, ele está com algumas configurações que foi o Dev que fez, o Dev não tem tudo o que o nosso computador tem. Então vamos lá, vamos dar uma olhada aqui.

[01:27] Baixei o projeto, abri no Android Studio aqui já para nós. Dei um play na nossa aplicação, no nosso emulador aqui.

[01:36] O nosso emulador já deu um erro aqui, mas esses erros são fáceis de consertar. A primeira coisa que temos que pensar é o seguinte: aqui tem um HTTP com o link do servidor que abriu.

[01:50] Só que esse HTTP aqui é do servidor local, lá no computador do Dev. No caso, agora temos que botar o meu IP de servidor, eu vou alterar aqui para 'http://192.168.0.60:8080/api'. Só precisa mudar os números, não precisa mudar a API, não precisa mudar o events, nem nada.

[02:07] Leonardo Marinho: Para saber qual é o seu IP, você pode abrir o CMD e digitar ipconfig se você estiver no Windows, se for no terminal ou alguma variação disso, mas geralmente é ipconfig, ifconfig, alguma coisa assim, e você consegue saber qual é o IP da sua máquina lá no IPV4.

[02:22] Kako: Exatamente. Então eu vou rodar mais uma vez o nosso aplicativo, mas vocês vão ver que ele está com um problema que ele fala: "bad state, HTTP inseguro".

[02:33] Olha, hoje agora, o Flutter não gosta de comunicações inseguras. Como estamos trabalhando com um servidor local, abrir um servidor HTTPS local é meio estranho, então abrimos em HTTP. Como fazemos para trabalhar como um servidor HTTP sem o S de security no Flutter?

[02:54] Você vem aqui, no projeto, no menu lateral, vai abrir a sua pasta do Android, vai abrir a pasta de "app", a pasta de source “src” - está acabando - a pasta "debug" e, aqui dentro, tem o "AndroidManifest.xml". Lembrando: é a pasta "debug", não é a pasta "main", é a pasta "debug". Abriu o "AndroidManifest.xml", aqui você vai colar - vou deixar também na atividade para você esse texto para você colar. Você vai colar esse texto aqui.

[03:24] É um application falando uses clear text traffic. Isso permite que você receba dados HTTP no Flutter. Vou rodar mais uma vez, dar um "wait" no emulador. Eu tenho que fechar o aplicativo e rodar novamente, que ele vai salvar tudo o que nós mexemos no "AndoridManifest". Esperar uns minutos, uns segundos, que ele está rodando.

[03:49] Leonardo Marinho: É importante sempre rodar de novo. Então feche a aplicação, stop, e roda de novo, porque o "AndroidManifest", quando muda, se você der um reload ali, ele não vai pegar, tem que levantar a aplicação de baixo.

[03:59] Kako: Então ok, conseguimos rodar a nossa aplicação. Só que uma coisa: ela está vazia, não tem nada aqui. Por que será? Explica para nós, Léo, por que está vazio aqui?

[04:09] Leonardo Marinho: Por que ela está vazia? Porque quando nós configuramos o nosso servidor web, nós não cadastramos nenhum evento, 0 cadastros de eventos. Para conseguirmos algum dado na aplicação Flutter, nós precisamos ir na aplicação web e cadastrar um evento. Então, na primeira opção à esquerda, "Eventos", você consegue cadastrar um novo evento.

[04:28] Basicamente ele vai pedir algumas informações: o título, a descrição, uma URL de uma imagem da web que você queira usar. É em cima desse cadastro que a sua aplicação poderá puxar esses dados e listá-los na tela do aplicativo Flutter. Então essa comunicação de quais dados que são exibidos no aplicativo vem desse servidor local nosso.

[04:49] Kako: Eu vou pegar uma imagem aqui para nós, de Flutter, só para não ficarmos sem imagem.

[04:56] Leonardo Marinho: Não.

[04:56] Kako: Vou pegar aqui.

[04:57] Leonardo Marinho: Tem que ficar bonito.

[04:57] Kako: Abrir em nova guia. É uma imagem pequena? Por que isso, cara? Ficou pequena demais, vou pegar uma maior aqui, vou acessar. Gostei, abrir em nova guia. Melhor, agora sim. Pego esse link e posso botar aqui, no evento que estamos criando. Esse link eu posso botar aqui e salvar.

[05:17] Leonardo Marinho: Isso.

[05:18] Kako: Beleza, está aqui.

[05:21] Leonardo Marinho: Beleza.

[05:23] Kako: Então ainda não apareceu no emulador. Mas é por que temos que o quê? Temos que relodar o nosso aplicativo. Vou dar um stop aqui e dar um run again.

[05:34] Leonardo Marinho: Fica como desafio, se você quiser colocar um pull to refresh, que é uma puxada na tela que atualiza a lista, você pode implementar também essa função, nós deixamos em aberto para você poder melhorar o aplicativo. Então dá para você criar uma função ali, quando você puxa a tela, a lista vai no servidor, puxa os dados e atualiza. Se você quiser também pegar para brincar, está na sua mão.

[05:51] Kako: Perfeito, galera. Então, olha só, é isso aqui, já estamos nos comunicando com o nosso servidor. A ideia é que o pessoal comece a colocar eventos de Meetups aqui e você receba notificações - lá na frente, quando tivermos configurado tudo.

[06:03] Leonardo Marinho: Isso.

[06:04] Kako: Notificações que o servidor foi atualizado.

[06:07] Leonardo Marinho: Perfeitamente. Então, basicamente, recapitulando, por que nós fizemos isso? Nós colocamos o IP que está o servidor, o IP e a porta que está o servidor local na nossa máquina, para a aplicação que está na nossa máquina entender onde tem que buscar os dados. Se esse servidor estivesse na web, você teria que colocar o IP ou o DNS, o "www." qualquer coisa que tivesse, para o aplicativo poder ler esses dados da API do servidor.

[06:28] Se você tiver curiosidade, mexe no código do aplicativo, dê uma olhada no arquivo "web.dart" como que está se comunicando com a API e também no repositório do Dev Meetups API tem lá todos os endpoints, todos os pontos que você lê e envia dados para ele, e tudo mais, bem bacana. Então agora a aplicação está lendo os dados, mas ainda não tem a notificação de push. Agora nós precisamos aprender como vamos resolver isso.

[06:52] Kako: Exatamente. Então na próxima aula vocês vão aprender um pouco a mexer no nosso Firebase Cloud Messaging.

[06:59] Leonardo Marinho: Isso, então até lá.

@@07
Inicializando o FCM

[00:00] Leonardo Marinho: Continuando, agora nós temos a aplicação web configurada, nós temos o nosso aplicativo Flutter configurado para se comunicar com a aplicação web, configuramos o Firebase no aplicativo Flutter, então olha que legal a quantidade de coisa que nós já fizemos.
[00:13] Agora, por último, mas não menos importante, temos que configurar o Firebase Cloud Messaging, que é a solução do Firebase para se comunicar com a nossa aplicação. É em cima do Firebase Cloud Messaging que conseguimos fazer toda a integração para mandar notificações para o nosso aplicativo.

[00:29] Então agora vamos partir disso: por onde começar a configurar o Firebase Cloud Messaging no aplicativo Flutter. O Kako vai começar a mostrar aqui, você está vendo a tela do FlutterFire, que é basicamente um apanhado de pacotes de Flutter, que envolvem comunicação com o Firebase.

[00:48] Tudo o que envolve comunicar com as soluções do Firebase você vai achar neste FlutterFire. Tem tudo ali, tem authentication, tem Crashlytics, tem push, tem banco de dados, tem tudo, funções, enfim. É ali que vamos achar o nosso Cloud Messaging, lindo, maravilhoso, que vai nos ajudar ao longo deste curso. Kako, manda lá.

[01:07] Kako: Só um adendo, um adendo que é sempre importante aprendermos a sermos amigos da documentação. A documentação nos ajuda demais ajuda muito. Então "firebase.flutter.dev", tem tudo lá que você precisa saber sobre comunicação com o Flutter e o Firebase. Vamos lá, para o nosso Cloud Messaging?

[01:29] A primeira coisa a se fazer aqui é clicar em "Getting Started", no menu lateral esquerdo. Aqui você terá um bocado de informação, vários tópicos diferentes. Nós já vamos pular um pouco isso, já vamos direto para o tópico "Cloud Messaging". Você clica em "Cloud Messaging", você terá "Overview", "Usage", "Apple Integration", um bocado de coisa. Clique em "Overview" primeiro.

[01:49] Aqui ele vai explicar um pouco o que o Cloud Messaging faz, aquelas explicações que nós já demos naquelas aulas passadas. Se você quiser dar uma olhada no vídeo de introdução de novo não faz mal, fique à vontade.

[02:02] Leonardo Marinho: Por onde começamos? Por onde começamos com qualquer extensão Flutter. Você vai no pubspec.yaml e especifica a extensão que você quer.

[02:11] Mas repare o seguinte: junto com o Firebase Cloud Messaging, você tem que ter o firebase_core também no seu Flutter, porque é dependência, Firebase Core é o pai, o Firebase Messaging é o filho. Então Kako, jogue lá para nós essas duas.

[02:28] Kako: Vou abrir aqui o nosso projeto, já vou abrir o que? O nosso pubspec.yaml. Mais uma vez.

[02:36] Leonardo Marinho: Geralmente, embaixo do cupertino_icons, que é um macete.

[02:39] Kako: É. Então aqui, já vou deixar identado para não termos problema. O que eu vou fazer aqui? Eu vou no navegador e vou copiar o código, porque fica mais fácil. Vou copiar o firebase_core, não vou copiar a versão, porque ele já baixa a versão mais nova. Abre aqui, no código. E, antes de dar um run, eu vou pegar o firebase_messaging também. Vou pegar a versão mais nova, da mesma forma.

[03:13] Antes de dar o pub get aqui, tem uma coisa importante que eu quero falar com vocês. Olha só, aqui, na nossa documentação, ele está perguntando se você quer legacy ou null safety.

[03:23] O null safety é a versão mais nova. Se estamos pegando a versão mais nova, sem o versionamento especificado, nós vamos pegar a versão null safety, é importante mencionar isso. Então vou no nosso código, já falo para dar um pub get, voltar lá, dar um pub get.

[03:41] Três segundos, pegou tudo, já está tudo no nosso projeto agora. Vamos voltar para a documentação. O que mais precisamos saber?

[03:50] Leonardo Marinho: Tem uma parte muito importante, que temos que nos atentar, que é a parte de integração com o Android. Se você estiver na versão 1 do Flutter, ou seja, a versão antes da null safety, você vai ter que fazer os passos que estão ali no "Flutter Android Embedding V1".

[04:02] Tem uns códigos extras que você tem que adicionar na aplicação. Como nós estamos começando esse projeto da aplicação Flutter versão 2, então podemos usar null safety e não precisamos fazer nada, esse código aqui você ignora completamente.

[04:16] Isso está dizendo naquela parte azul ali em cima, em inglês, mas você pode traduzir, usar o seu navegador para traduzir se quiser.

[04:22] Está dizendo basicamente que se você usar o Flutter na versão 2, ou maior ou igual, você não precisa usar nada, e se você tiver igual a 1, ou alguma coisa assim, você tem que fazer essas etapas. É basicamente isso. Então nós podemos pular, no nosso caso aqui. E tem algumas coisas interessantes: se você quer fazer push notification para iOS, para a Apple, tem uma seção específica para isso.

[04:46] Porque a Apple já tem outros esquemas de certificado de provisionamento, certificado de liberação de push, você tem que ter uma conta de desenvolvedor da Apple para gerar esses certificados. Então tem o detalhamento de como fazer todas essas coisas. Então vamos pular o item 4, vamos para o 5.

[05:03] O Flutter, depois da V2, ele gera web, então conseguimos fazer HTML, conseguimos rodar um site em Flutter, se você quiser. Aqui ensina como você integra push notification com o Flutter web também, é bem legal. É só copiar e colar esse código no HTML.

[05:18] Kako: Um adendo: agora, a partir de 2021, com o Flutter 2.0, que nós temos muitas coisas novas, null safety, web, suporte para web e etc., é importante você saber que nem tudo funciona no web. Existem pacotes que não tem suporte para web. No caso, o Firebase nos ajuda bastante com a web, já tem os pacotes todos atualizados para funcionar em web.

[05:44] Você quer que o seu pacote funcione em web, que seu aplicativo funcione na web, você tem que adicionar esse código no seu index HTML, lá da sua pasta web no seu projeto.

[05:55] Leonardo Marinho: Precisamente, é importante falar isso: depois que você gera o projeto, você vai lá e coloca.

[06:00] O que ele fala agora é rebuild your app, rode novamente o seu aplicativo. Por que ele fala isso? Porque se der algum banzé, você vai saber. Se não der nenhum banzé, ele vai funcionar perfeitamente e podemos pular para os próximos passos.

[06:14] Kako: Eu vou parar a aplicação aqui então.

[06:16] Leonardo Marinho: Sempre pare. Botou plugin novo, mexeu em coisa nativa, stop e mande rodar de novo.

[06:22] Kako: Mandando rodar de novo. Mas eu queria muito colocar isso em web, olha que coisa linda, olha que coisa fácil esse código. Como o Flutter ajuda, não é?

[06:32] Leonardo Marinho: E é interessante, porque o Firebase, em geral, as aplicações Firebase, elas são todas multiplataforma. Você está no web, funciona, você está no outro, funciona, de boa. Aquele vermelho que deu ali não precisa ter problema, porque é aviso de deprecated.

[06:47] Não é erro, é só: tem um negócio aqui meio depreciado, fique esperto porque pode ser que nas próximas versões pode ser que saia. Mas como é do projeto nativo do Flutter, isso não é um problema nosso, é um problema da Google, a Google tem que atualizar isso no Flutter.

[06:59] Kako: Exatamente. Então rodamos a nossa aplicação, já está livre aqui. Não tivemos nenhum banzé, como diria nosso grande amigo Léo, e está tudo certo.

[07:08] Leonardo Marinho: Agora podemos pular para os próximos passos, que basicamente são configurar o código e receber notificações, finalmente. Esperamos você no próximo vídeo.

@@08
Faça como eu fiz: Configuração do Firebase

Faça como eu fiz e configure o Firebase no seu aplicativo Android!
Você pode acompanhar o tutorial de instalação na página da documentação do FCM.
Configure sua aplicação no Firebase console, coloque o arquivo google-services.json dentro da pasta android/app e instale o FCM no seu projeto Flutter.

https://firebase.flutter.dev/docs/messaging/usage

Para instalar o FCM em um projeto Flutter, você precisa declarar o Firebase Core e o Firebase Cloud Messaging no arquivo pubspec.yaml:
pubspec.yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: "^0.7.0"
  firebase_messaging: "^8.0.0-dev.15"
COPIAR CÓDIGO
Posteriormente, execute o comando flutter pub get.

Mas somente isso não basta. É necessário configurarmos a classe Application no projeto nativo Android da seguinte maneira:

// ...
import io.flutter.plugins.firebase.messaging.FlutterFirebaseMessagingBackgroundService;

public class Application extends FlutterApplication implements PluginRegistrantCallback {
  // ...
  @Override
  public void onCreate() {
    super.onCreate();
    FlutterFirebaseMessagingBackgroundService.setPluginRegistrant(this);
  }

  @Override
  public void registerWith(PluginRegistry registry) {
    GeneratedPluginRegistrant.registerWith(registry);
  }
  // ...
}COPIAR CÓDIGO
O que vamos alterar é justamente inserir a linha de comandos: FlutterFirebaseMessagingBackgroundService.setPluginRegistrant(this);

E, por último, no arquivo androidmanifest precisamos inserir o seguinte comando:

        android:name=".Application"
        ...COPIAR CÓDIGO
Para mais informações, você pode consultar a documentação do plugin do FCM para o Flutter.

https://firebase.flutter.dev/docs/messaging/overview

@@09
Sobre o FCM

Durante a aula, você viu uma introdução sobre o que é o Fire Cloud Messaging (FCM) e como podemos utilizá-lo para enviar notificações, tanto para aplicações Android e IOS quanto para web.
Em relação ao que aprendemos, selecione as alternativa corretas:

O serviço do FCM permite enviar mensagens sem nenhum custo pelo serviço.
 
Alternativa correta! Isso mesmo! Até o momento em que o curso foi gravado, o plano do FCM é gratuito, independente da quantidade de mensagens enviadas.
Alternativa correta
Para receber as mensagens, cada dispositivo de plataformas diferentes solicita mensagens via requisição ao FCM.
 
Alternativa correta
O FCM é uma solução de persistência de dados online para diversas plataformas.
 
Alternativa correta
Além do Android, o FCM envia mensagens para iOS e aplicações web.
 
Alternativa correta! Isso mesmo! O serviço do FCM tem o objetivo de enviar mensagens para diferentes plataformas com os padrões esperados.

@@10
O que aprendemos?

Nesta aula, você aprendeu:
Como configurar o Firebase Console
O Firebase Console é utilizado para criar um projeto ao qual vamos vincular o nosso aplicativo tanto web quanto mobile. É através dele que todas as soluções Firebase podem ser geridas, e elas vão muito além do FCM. Nesse console é possível encontrar o monitoramento de bugs, testes de performance, bancos de dados e mais uma série de funcionalidades.
Como configurar o servidor web da nossa aplicação
Inicializamos o servidor localmente, utilizando o comando java para que o aplicativo em Flutter possa ler os dados do banco de dados e exibir os eventos na tela para o usuário.
Como configurar o aplicativo Flutter para acessar a API
Com a configuração no arquivo web.dart conseguimos fazer o app funcionar junto ao IP do nosso servidor local que está hospedado na nossa máquina, assim garantimos que o app saberá em qual local ele deve requisitar os dados que exibirá na tela.
Aprendemos sobre o Firebase Cloud Messaging (FCM)
Fizemos um panorama das áreas que o Firebase Cloud Messaging abrange, como enviar notificações de push para as plataformas Android, iOS e web. Através dele, é possível enviar mensagens segmentadas a um determinado público, que você pode definir previamente; enviar para um usuário em específico ou, ainda, enviar para todos os usuários que utilizam o seu aplicativo.