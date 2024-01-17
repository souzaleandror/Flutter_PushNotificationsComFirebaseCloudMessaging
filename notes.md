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

#### 12/01/2024

@02-Integração com o web app

@@01
Projeto da aula anterior

Caso queira, você pode baixar o projeto do curso no ponto em que paramos na aula anterior.

https://github.com/alura-cursos/flutter-notifications/tree/aula_1

@@02
Enviando o dispositivo para o servidor

[00:00] Leonardo Marinho: Continuando com o nosso estudo de push notifications, nós temos basicamente dois caminhos para enviar notificações para os dispositivos através do Firebase Cloud Messaging. O primeiro é enviando para todos os dispositivos de dado segmento.
[00:13] Por exemplo, no console do Firebase Cloud Messaging nós conseguimos selecionar todos os Androids, ou todos os iOS, caso tenhamos configurado, e mandar a notificação para eles em broadcast, mandar espalhado para todo mundo. Mas não é o que normalmente é feito. Geralmente queremos mandar para um dispositivo específico, e é o que nós vamos usar aqui.

[00:31] O que faremos nesse fluxo? Primeiro o aplicativo Flutter vai receber um token, nós chamamos isso de push token, que é um identificador único do seu aplicativo no seu celular em específico. Com esse token nós conseguimos, no mundo todo, saber que é o seu celular, o seu aplicativo, nós mandamos só para você.

[00:51] Então o Firebase Cloud Messaging gera esse token, nos manda e conseguimos pegar isso através do plugin que nós instalamos anteriormente. Mas, como funciona o fluxo? Nós precisamos passar esse token para a aplicação web do Dev Meetups, para ela poder mandar para o Firebase Cloud Messaging o token para ele poder efetivamente mandar a mensagem, nós podermos fazer essa troca e envio de mensagens.

[01:15] É isso que vamos fazer agora nesse vídeo, vamos criar um mecanismo para nos comunicar com o Dev Meetups, passando as informações de token que nós precisamos. Então, Kako, mostre para a galera como começamos a fazer isso.

[01:27] Kako: Aqui o que é? É uma comunicação API. Se estamos nos comunicando com a API, o que precisamos fazer? Precisamos entender como é a requisição de post, de get, etc. “Como fazemos isso? Eu não lembro mais”. Calma, na dúvida, vamos sempre onde? Na documentação.

[01:46] Na documentação que nós mostramos mais cedo, do GitHub do nosso Meetups API, temos aqui como se comunicar. Aqui embaixo, vocês vão descer e procurar mapeamento de end-points.

[01:59] Aqui temos os dispositivos e ele vai falar - você pode ler com calma, por enquanto eu já vou passar as leituras. Ele vai falar para você se comunicar com o devices. Quando você está se comunicando com o devices, você quer pegar informações do servidor, você tem que usar o get e você tem todo esse formato de JSON aqui.

[02:19] Precisa de um modelo, uma marca, um token - lembrando que isso é um mapa, um Flutter. E quando estamos usando o post, porque, no caso, vamos usar o post agora, também precisamos setar uma marca, um modelo e um token.

[02:31] Nós vamos pegar a marca do nosso celular, o modelo dele e o token que vamos receber. Vamos uma coisa de cada vez. Vamos para o Android Studio, vamos criar essa função. Primeiramente vamos criar a função, vou chamar ela de void sendDevice(). Ela precisa receber um device, que é um modelo, e eu vou chamar esse device de (Device device).

[02:57] Mas que modelo é esse Device? Esse modelo já está criado, já está disponível para você. Se você quiser ter uma ideia de como funciona, eu importei ele aqui, você pode vir na pasta "models" e aqui tem o "device", toda a classe, como ela funciona, já com marca, modelo, token.

[03:15] Continuando o código, então nós temos o nosso (Device device), eu vou fazer ele ser assíncrono porque estamos nos comunicando, é importante que seja assíncrono, (Device device) async {}. Vamos lá, nós já brincamos com esse antes, primeira vez temos que mandar uma resposta, final response = await, temos que esperar por essa resposta e temos que pedir pelo await http.post() que façamos um post.

[03:36] Até agora tranquilo. Vamos lá, o link do nosso post, o URI, precisamos usar http.post(Uri.parser()). Qual é o nosso URI de fato? Ele é o nosso base URI, que a já temos lá em cima, que já setamos, então Uri.parse('$baseUrl'), no caso.

[04:02] Leonardo Marinho: Isso.

[04:02] Kako: Valeu. ('$baseUrl/') barra o quê? ('$baseUrl/devices'). Até agora tudo tranquilo, acho que eu não perdi nada aqui. Vou jogar uma vírgula aqui para podermos identar. Aqui, no final, acho que está faltando um ponto e vírgula, se eu não me engano.

[04:24] Então já fizemos o nosso parse, agora precisamos do headers:. Nosso headers será do estilo headers: <String, String>{}, lembrando aquele mapa que mostramos agora há pouco para vocês, na documentação. Vamos lá, o que precisamos neste headers? Precisamos do tipo de conteúdo.

[04:48] Temos que falar aqui 'Content-Type':, aquele mesmo esquema que brincamos, temos que falar que é uma aplicação do estilo JSON. Então aqui é 'Content-Type': 'application/json;', e falar que é caráter 'application/json; charset=UTF-8'. Estou esquecendo alguma coisa, Léo? Acho que não, até agora nada.

[05:21] Leonardo Marinho: Não, suave. Isso aí.

[05:24] Kako: Então já temos o headers. Qual é a próxima parte depois do headers? O body:. No body temos que fazer o encode do JSON, body: jsonEncode(<>). Temos que transformar isso em (<String, String>{}), mesmo esquema. Vai ser um mapa. Vamos lá, deixa eu descer a tela aqui para podermos enxergar numa boa.

[05:50] Um mapa, deixa eu botar uma vírgula no final. Como vai funcionar o nosso mapa? Vamos lá, precisamos do 'token':, do nosso token vamos pegar o que? Vamos pegar a informação do nosso 'token': device.. Lembrando que a classe device tem o device.token ?? nela.

[06:07] Caso não tenha nada no nosso device, nós colocamos uma string vazia, device.token ?? ' ',. Mas não deixe de colocar essa string vazia, se não vai pegar nulo, vai quebrar um bocado de coisa, dá uma dor de cabeça. A próxima parte, 'modelo':, a mesma coisa, pega 'modelo': device.model ?? ' ',, mesmo esquema, se não tiver nada, string vazia.

[06:30] Agora 'marca':. Estamos acabando, 'marca': device.brand ?? ' '. Até agora tranquilo, fizemos a nossa função sendDevice. E agora, o que precisamos fazer? Léo, dá uma luz para nós.

[06:48] Leonardo Marinho: então temos a função que vai enviar os dados para o servidor da nossa aplicação. Mas e aí? Mas que dado? De onde estão vindo esses dados? O que temos de dado? Não está fazendo muito sentido ainda a coisa toda. Agora nós conseguimos pensar o seguinte, nós precisamos pegar o token e precisamos passar, de alguma forma, via um objeto instância da model device para essa função.

[07:21] O que vamos fazer? Tem que retornar, precisaremos retornar esse sendDevice. Então Kako, bota um return ali.

[07:27] Kako: Um return?

[07:30] Leonardo Marinho: Isso.

[07:30] Kako: Aqui, no final, já?

[07:33] Leonardo Marinho: Isso.

[07:35] O que vamos fazer? Vamos retornar esse return response;. Agora temos que ir no nosso "main.dart" para continuar codando. Lá temos que instanciar o Firebase Cloud Messaging e temos que montar a função que vai se comunicar com a sendDevice.

[07:54] Kako: Então vamos lá. No nosso "main", o que temos que fazer? Temos que nos comunicar com o Firebase. Vamos lá, o Firebase aqui, vou alterar a nossa função main. Vou trocar essa seta, =>, não quero mais essa seta, quero que seja por chaves. Vou tirar esse runApp daqui de fora e colocar dentro da nossa nova main, "Ctrl + Alt + L" para identar, void main () {runApp(app());}.

[08:20] Vamos brincar um pouco. Quando estamos mexendo com Firebase, tem alguns processos que precisamos fazer, nós já brincamos com isso em outros cursos, mas é importante fazer de novo. Então vamos lá, a primeira coisa que temos que fazer é falar WidgetsFlutterBinding.ensureInitialized(), temos que nos assegurar que está inicializado, senão ele vai quebrar um bocado de widgets.

[08:40] Temos que esperar pelo Firebase, mas se eu estou esperando, a função main tem que ser assíncrona, então vamos mudar a main para ser assíncrona, void main() async. Então await Firebase - tem que achar o Firebase também, vou dar um "Alt + Enter" e importar o Firebase Core, await Firebase.initializeApp().

[09:04] Perfeito. Agora temos que pegar uma função do Firebase Messaging, para recebermos as mensagens do Firebase Messaging.

[09:14] Leonardo Marinho: Certíssimo.

[09:14] Kako: FirebaseMessaging, eu vou chamar de FirebaseMessaging messaging =. Esse messaging vai ser o nosso = FribaseMessaging.instance;. Até agora tudo tranquilo. Agora temos que setar o nosso token. Chegamos aqui String.

[09:39] Leonardo Marinho: Agora que é a hora da verdade, porque finalmente vamos receber o token da aplicação.

[09:42] Kako: String token = await;

[09:45] Leonardo Marinho: Então tudo o que fizemos até agora foi para nos prepararmos para chegar a esse token. Finalmente, agora identou o token. Já dá para fazer muita coisa legal.

[09:52] Kako: String token = await messaging, tem que receber o quê? O messaging.getToken();. Agora aqui acho que ele está me pedindo alguma coisa.

[10:02] Leonardo Marinho: Vamos ter o problema do null safety. Então o que você tem que fazer é lá no string colocar interrogação, String? token.

[10:09] Kako: Beleza, perfeito.

[10:10] Leonardo Marinho: Viu?

[10:10] Kako: Verdade, porque senão ele vai receber nulo no começo e vai quebrar tudo.

[10:13] Leonardo Marinho: Exatamente.

[10:14] Kako: Vou até botar para printar o nosso token, só para termos certeza quando formos rodar, print('TOKEN: $token');. Agora, para finalizar, temos que setar o nosso push token, porque não temos em nenhum lugar o nosso push token, uma função para ele.

[10:37] Leonardo Marinho: Exatamente. É agora que vamos pegar esse token, passar para uma função chamada set push token e essa função posteriormente vai se comunicar com o sendDevice.

[10:46] Kako: setPushToken(token);, que é o nosso token que estamos brincando. Só que essa função não existe, teremos que criar ela. Então vou criar ela aqui, bonita, rápida aqui, só para não ficarmos com esse vermelho aqui. Aqui um void setPushToken(), ele vai receber uma (String?), que não pode ser nula, (String? token). Agora não está mais vermelho lá em cima. Vai ser assíncrona e eu vou fechar chaves, void setPushToken(String? token) async {}.

[11:18] Beleza.

[11:21] Leonardo Marinho: Então agora só resta testar.

[11:24] Kako: Não vou fazer o nosso set push token, porque senão essa aula vai ficar muito grande e tal. Vou dar um run na nossa aplicação, para vermos se está tudo certo. Já deu um problema aqui.

[11:36] Leonardo Marinho: O return response.

[11:38] Kako: Ele está retornando o response.

[11:38] Leonardo Marinho: Então comenta o // return response;.

[11:41] Kako: Nós não queremos esse return por enquanto. Mais tarde. Dei um run.

[11:46] Leonardo Marinho: Mais tarde vamos descobrir para que serve. Leonardo Marinho: Temos um push token e ele é bem grande, porque é o identificador único do aplicativo no seu celular, aquela coisa que eu falei, no mundo todo, ele acha aquele aplicativo no seu celular. Então é um push token bem grande, mas nós recebemos o push token do Firebase Cloud Messaging e agora para brincar é super legal.

[12:04] Kako: Ufa. Ok.

[12:06] Leonardo Marinho: Então agora falta nos comunicarmos com a aplicação Dev Meetups.

[12:11] Kako: E é isso o que vamos fazer na próxima aula.

@@03
Obtendo dados do dispositivo

[00:00] Leonardo Marinho: Agora temos o push token já no nosso aplicativo. Demos um print no último vídeo e vimos que ele está vindo bem legal.
[00:07] Agora, o que temos que fazer com ele? Vamos pegar o token quando o aplicativo abrir. Então o start do aplicativo, ele é assíncrono, nós definimos, ele disse: DART, é o seguinte, é assíncrono, o Firebase tem que carregar, depois temos que pegar uma instância do Firebase Cloud Messaging e, depois dessa instância nós recebemos o token.

[00:25] Com o token, a ideia é passarmos ele para a função set push token. Essa função vai tratar o dado do token e vai buscar também os dados do dispositivo, afinal, lembra, o Kako falou que na API do Dev Meetups web nós precisamos passar para um end-point chamado /devices dados de marca, modelo e o token.

[00:48] Agora precisamos descobrir como pegamos a marca e o modelo do celular, o token nós já temos. Essa função setPushToken vai passar o objeto do device já de acordo com a model que temos no aplicativo, de device e pegar a função send device para finalmente a aplicação do Dev Meetup web receber ela.

[01:06] É isso o que vamos fazer nesse vídeo. Kako, mostre para a galera como começamos o processo, como pegamos esses dados de marca e modelo, por onde nós vamos.

[01:16] Kako: Mostro sim. A primeira coisa aqui, vamos usar o que? Um pacote. Existe um pacote chamado "device_info_plus 2.1.0".

[01:24] Ele nos ajuda a pegar as informações do nosso dispositivo e ele funciona tanto para Android, iOS, Mac, web, Linux, Windows, seu carro, sua bicicleta, todo lugar funciona. É bem tranquilo de usar, tem tudo explicado aqui para você, que quiser dar uma parada e dar uma lida em como é que funciona, para você usar o device info plugin, fique à vontade, dê uma pausa e dê uma lida.

[01:48] Lembrando que o nome desse pacote nós pegamos no "pub.dev" e o nome dele é "device_info_plus". Vamos lá, quando estamos falando de pacotes, a primeira coisa a se fazer é colocar no "pubspec".

[00:01:59] Leonardo Marinho: Exatamente.

[02:00] Kako: Então vamos lá, para o Android Studio. No nosso "pubspec" nós vamos aqui e vamos deixar tudo identado, bonito.

[02:06] Leonardo Marinho: Isso é muito importante, nós já vimos isso, você está fazendo a formação de Flutter, você já deve ter visto várias vezes, mas também se não está, sempre vale ressaltar: a tabulação, nesse arquivo, é o que manda na hierarquia. Então se você errar a tabulação, ele não vai funcionar de jeito nenhum.

[02:20] Kako: Exatamente. Já aproveitei aqui, depois que eu acabei de escrever, já dei um pub get para pegarmos todos os dados desse pacote. Então vamos lá, a primeira coisa que temos que fazer é voltar no nosso "main.dart", na nossa função setPushToken e pegar as dependências que está devendo.

[02:36] Pegamos as dependências. Então vamos brincar aqui com o nosso setPushToken agora. A primeira coisa a ser feita, nós vamos usar o nosso novo plugin, DeviceInfoPlugin, já vamos usar ele aqui, vou chamar DeviceInfoPlugin deviceInfo =, o nome desse device plugin.

[02:56] Não esqueça de pegar, não é, Kako? Já pegou quando eu cliquei nele aqui, que ele estava malvado comigo. Esse DeviceInfoPlugin deviceInfo = é um = DeviceInfoPlugin();.

[03:11] Leonardo Marinho: Basicamente, para traduzir ali, nós criamos uma variável chamada deviceInfo, que vai receber uma instância de um objeto que é do tipo DeviceInfoPlugin do construtor da classe DeviceInfoPlugin da extensão que acabamos de instalar.

[03:25] Kako: Perfeito. Agora eu vou botar aqui uma string, lembrando do null safety, porque não queremos que seja nulo. É String? brand;, que é a nossa marca e String? model;.

[03:42] Leonardo Marinho: Que é o modelo do seu dispositivo, model.

[03:45] Kako: Agora vamos começar a brincar com algumas condições.

[03:48] Leonardo Marinho: Kako, aí vai a pergunta: no Android e no iOS, é igual ou é diferente para obter essas coisas? O plugin se comporta de uma maneira igual ou diferente?

[03:57] Kako: Diferente. É diferente?

[04:01] Leonardo Marinho: Diferente? É, então vamos fazer o seguinte? Acho que precisamos então testar se o aplicativo está no Android ou está no iOS.

[04:08] Kako: Perfeito. Então colocamos uma condição aqui, eu venho no if() e coloco um plataforma, um (Platform), certo?

[04:19] Leonardo Marinho: Isso.

[04:19] Kako: E eu venho aqui e pergunto: você é Android? if(Platform.isAndroid).

[04:26] Leonardo Marinho: Isso é uma coisa muito legal, porque esse platform é do próprio Flutter, então só vão assim.

[04:31] Kako: Isso. Agora aqui, por algum motivo, o isAndroid não pegou.

[04:36] Leonardo Marinho: Veja se o import rolou direito.

[04:39] Kako: Pois é.

[04:42] Leonardo Marinho: Ali, importou um dart:html lá em cima. Não é esse cara não.

[04:45] Kako: Não é esse cara não.

[04:46] Leonardo Marinho: Tem que ficar dentro do Android Studio, porque geralmente ele faz isso, ele importa o errado. Se eu não me engado, é dart io, mas dá um clique.

[04:53] Kako: dart io, aqui.

[04:54] Leonardo Marinho: Isso aí, é dart io.

[04:54] Kako: Beleza, é do próprio Flutter, mas ele tem em vários lugares, então é bom saber.

[04:59] Leonardo Marinho: Isso é uma baita pegadinha.

[05:01] Kako: Baita pegadinha. Então aqui agora está, o import 'dart:io'; e agora ele pegou o isAndroid. Então se ele for Android, nós temos que fazer toda uma configuração do nosso device. Eu vou fazer aqui, a primeira coisa no nosso plugin nós temos que AndroidDeviceInfo, eu vou chamar de AndroidDeviceInfo androidInfo = e isso tem que esperar pelas informações do nosso device.

[05:37] Então = await deviceInfo., eu quero que você descubra quais são as informações do Android para mim, por gentileza, await deviceInfo.androidInfo;. Isso está tudo na documentação, não se preocupem.

[05:49] Leonardo Marinho: É basicamente um assincronismo, porque o aplicativo não sabe o tempo que o sistema operacional vai levar para retornar esses dados, então botamos um await e esperemos, já que a função setPushToken é async.

[05:59] Kako: Perfeito, eu vou botar um print(' '); só para sabermos qual é o modelo do nosso Android, se for Android.

[06:05] Leonardo Marinho: Perfeitamente.

[06:05] Kako: Vou botar ('Rodando no ${}');, vou botar chaves, porque é muita coisa, {androidInfo.model}, modelo, model, no caso. Então para terminar essa parte do Android, eu tenho que definir qual é o modelo e qual é a marca do nosso dispositivo. Então o model =, ele vai receber = androidInfo.model;. Isso vem do nosso pacote. O brand = também é a mesma coisa, = androidInfo.brand;. Então estamos recebendo.

[06:52] Leonardo Marinho: Perfeito.

[06:52] Kako: Agora temos que fazer para o que não é Android, que é o iOS. Ou sei lá, vai que a pessoa tem um Windows Phone, nunca se sabe.

[07:03] Leonardo Marinho: E ainda, nos casos que estamos considerando Android ou iOS, mas, por exemplo, se você tem ideia de fazer um Flutter web ou fazer algum compilado no desktop Windows ou alguma coisa, até por isso a extensão, ela é multiplataforma absurdamente, porque você pode testar se a plataforma é iOS, se a plataforma é Windows, se a plataforma é Linux, é web.

[07:20] Aqui estamos usando Android e iOS, que são os mais comuns para exemplo didático, te mostrar como você segrega e separa, descobre um e outro, mas sinta-se livre para testar a plataforma que você quiser.

[07:33] Kako: Perfeito, falou bonito. Vou botar aqui else { IosDeviceInfo, o nosso pacote, então vou falar IosDevice iosInfo, eu acho que ele esqueceu alguma coisa menor aqui, não, ele só é chato comigo mesmo. É isso mesmo.

[07:45] iosInfo = vai receber o nosso = await, ele vai receber await deviceInfo e, no caso, ao invés de androidInfo, await deviceInfo.iosInfo;. Mesmo esquema, acabamos de fazer isso para o Android. Vou fazer um print(' ');, eu vou copiar e colar o print anterior, porque facilita a nossa vida, facilitar um pouco.

[08:11] Vou botar nosso semicolon, o ponto e vírgula, e ao invés de {androidInfo.model}, no caso eu tenho que mudar essa função. O que ela vira agora? Ela vira {iosInfo} - é um pouco diferente a Apple do Android, então mudamos um pouco.

[08:29] Leonardo Marinho: Por isso temos as plataformas.

[08:30] Kako: Então aqui, ao invés de colocar modelo e essas coisas, temos que botar {iosInfo.utsname.machine}. Agora temos o modelo do nosso dispositivo iOS.

[08:43] Agora precisamos fazer a mesma coisa que fizemos ali em cima, separar o modelo e a marca. Então modelo, mesmo esquema, vamos pegar model = iosInfo.ustname.machine;.

[08:58] Leonardo Marinho: Kako, aí fica a dúvida, a Apple não tem mais de uma marca que fabrica iPhones, é só a Apple, certo?

[09:04] Kako: Pois é.

[09:05] Leonardo Marinho: Então como faz?

[09:07] Kako: É fácil, nós definimos como brand = 'Apple';.

[09:12] Leonardo Marinho: Moleza. Realmente, acho que na extensão, não faz nem sentido dizer qual é a marca de um Apple. Legal.

[09:20] Kako: Modelo. Agora, para finalizar, só para finalizar um pouco, nós terminamos as nossas condições e temos que entregar o nosso device. Então temos que vir aqui e fazer o quê? Vamos embaixo do código que acabamos de fazer e definimos Device device = e vamos lá, o nosso device, temos que importar aqui o nosso pacote do modelo device, igual fizemos mais cedo.

[09:46] E o que rola? Nós temos que vir aqui e falar: eu quero um device, ele precisa do brand, modelo e token, então marca, modelo e token. Vamos lá, Device device = Device(brand: brand, model: model, token: token);. Já está definido, já temos o brand aqui, já está pegando o brand, já está pegando o modelo e o token. O token está pegando lá de cima também.

[10:09] Então já está pegando tudo o que nós precisamos. Só está faltando um ponto e vírgula no final dessa linha. Agora precisamos mandar esse device, que nós já fizemos a nossa função no nosso web dart. Vamos no final, sendDevice(device); e mandamos o device que acabamos de criar, mandamos as informações todas para o nosso servidor, do jeito que ele quer que ele receba.

[10:34] Leonardo Marinho: Maneiríssimo. Vamos testar e ver o que acontece?

[10:39] Kako: Vamos testar. Vou dar um run. Esperar um pouco.

[10:46] Leonardo Marinho: O que será que vai acontecer? Roda aí.

[10:48] Kako: Está aqui, agora temos que dar uma olhada no nosso grande amigo, nosso servidor.

[10:54] Leonardo Marinho: Beleza, então vamos entrar em "Dispositivos".

[10:57] Kako: Dispositivos. Opa.

[10:59] Leonardo Marinho: Ele ainda não detectou o dispositivo. Pode ser que ainda não deu tempo de o aparelho enviar. O que vamos fazer? Nós destruímos a aplicação, damos um stop e rodamos do zero de novo, para dar tempo de ela pegar o token e mandar para nós.

[11:13] Kako: Então vou parar total, eu fechei aqui e vou rodar de novo.

[11:18] Leonardo Marinho: O que acontece?

[11:18] Kako: Isso aqui ele vai fazer automático.

[11:21] Leonardo Marinho: É, porque o heavy reload, ele não roda o main toda hora, então a obtenção de token já passou. Isso é interessante ficar atento, sempre que for rodar o aplicativo.

[11:34] Kako: Aqui esperamos um pouco, aqui coisa de depreciado, já conversamos sobre isso nas últimas aulas, é só um warning mesmo. Está buildando.

[11:43] Leonardo Marinho: O token veio.

[11:45] Kako: O token veio.

[11:45] Leonardo Marinho: Rodando no SDK Google Phone, ou seja, ele detectou o emulador.

[11:48] Kako: Ele detectou o emulador e ele já falou aqui, é um Android.

[11:55] Leonardo Marinho: Exatamente.

[11:56] Kako: Google Phone e tal, bonito, senão ele tinha rodado, já tinha pego o else e entrado na Apple. Agora nós sabemos que rodou. Vamos dar uma olhada no nosso servidor. Vou voltar para o Dev Meetups, "Dispositivos" e temos o dispositivo.

[12:09] Leonardo Marinho: Temos o nosso token salvo no Dev Meetups API web. Agora conseguimos usar isso para nos comunicarmos futuramente com o nosso aplicativo. Mega maneiro. Agora precisamos pensar como otimizar esse envio de token para a aplicação, senão toda vez que o aplicativo abrir, ele vai mandar um token novo.

[12:32] Kako: Perfeito, então é isso o que vamos fazer na próxima aula. Valeu, galera.

@@04
Reenviando o token do dispositivo

[00:00] Leonardo Marinho: Como vimos, agora a nossa Dev Meetups web API já tem os dados de token, então o nosso aplicativo se comunica com ela. Mas nós temos um problema: toda a vez que o aplicativo abrir e receber um token, sendo ele igual ou não ao anterior que nós enviamos, ele vai reenviar esse token. Isso não é bacana, vamos combinar.
[00:19] Por quê? Porque senão ficaremos sobrecarregando o nosso servidor com um token que já existe, com uma coisa que já está lá, não tem porque ficarmos enviando várias vezes. O que podemos fazer? Podemos tratar isso no aplicativo para caso o último token recebido já tenha sido enviado, nós não enviarmos um novo.

[00:38] Por quê? Porque senão ficaremos duplicando o mesmo token. Então quando formos mandar uma mensagem, vai quatro, cinco mensagens iguais, porque ele vai mandar quatro, cinco vezes o mesmo token. A ideia aqui é toda vez que o Firebase Cloud Messaging renovar o token, gerar um token novo, porque de tempos em tempos ele renova, por questões de segurança e tudo mais, para evitar spam.

[00:57] Sempre que tiver um token novo, aí tudo bem, nós enviamos para a nossa aplicação web. Quando for o mesmo da última vez, não precisa enviar, não faz sentido enviar. Para isso, vamos usar uma biblioteca chamada shared preferences. Você poderia usar um sqflite, ou qualquer outro meio de persistência. Escolhemos o "shared_preferences 2.0.7" porque é basicamente chave e valor.

[01:16] É uma persistência pequena e simples de usar no Flutter, que nós conseguimos manipular sem muita complexidade. Agora o nosso querido Kako vai mostrar como podemos fazer isso.

[01:27] Kako: Vamos lá, vocês já mexeram com shared preferences e tal? Ou local storage, é o mesmo princípio: salvar dados pequenos. Se quiser, mesmo esquema, se quiser dar uma pausada, dar uma lida na documentação do shared preferences, não tem problema. Tem aqui como fazer o exemplo, como instala e etc. Fique à vontade.

[01:50] Aqui nós já vamos pegar na sua mão, já vamos facilitar a sua vida. A primeira coisa que temos que fazer é instalar o shared preferences e vocês já estão cansados de saber que temos que ir no "pubspec.yaml" e alterar aqui, colocando o shared preferences das nossas dependências.

[02:09] Aqui, logo depois do device_info_plus:, vamos vir em shared_preferences: - tenha certeza de que está escrevendo certo, senão ele não funciona, ou pega outro pacote que você não quer. pub get, padrão, espera, questão de cinco a dez horas - não, brincadeira, quatro segundos. Pegamos tudo. Agora temos que mudar um pouco, temos que salvar essa informação do token.

[02:39] Leonardo Marinho: Isso. Então vamos por partes. Nós temos a função, no "main", que é a sidePushToken. A sidePushToken precisa detectar esse token que ela está recebendo e salvar localmente. Depois temos que tratar isso também na sendDevice para garantir que realmente foi enviado e que não houve nenhum erro de HTTP, alguma coisa assim. Então na sidePushToken, nós precisamos declarar o shared preference.

[03:11] Kako: Ok. Então SharedPreferences, vou instanciar dentro do setPushToken e eu vou colocar um nome, sei lá, SharedPreferences pref, pode ser?

[03:19] Leonardo Marinho: Pode ser, fica tranquilo de entender.

[03:22] Kako: SharedPreferences prefs = await, porque teria que esperar isso funcionar, então temos que pegar await SharedPreferences.getInstance(); e pegar a instância dele, temos que esperar pegar ele. Vou criar aqui - deixa eu separar aqui desse device.

[03:40] Vou criar aqui outra string, vou chamar ela de String? prefsToken = ;, ponto e vírgula aqui, para ele não ficar brigando, = prefs.getString(), tem que pegar a string e a chave terá que ser o ('pushToken');. Agora um booleano, para diferenciar se ele já existe ou não, o token, é uma boa ideia.

[04:10] Leonardo Marinho: Exatamente. Então, qual é a ideia? Uma string será responsável por salvar o token que foi o último que nós recebemos - aqui, neste momento, estamos salvando o atual, o token mais recente e o booleano, que é o bool? prefSent = prefs.getBool('tokenSent');, vai dizer se ele já foi enviado ou não para a API do Dev Meetups.

[04:30] Então estamos trabalhando com essas duas variáveis, que ficarão salvas no shared preferences, que serão persistidas no dispositivo, para quando abrir, fechar, estar sempre salvo ali.

[04:42] Kako: Perfeito. Eu vou dar um print aqui, só para saber se estamos pegando as coisas certas e tal, é sempre bom, não é? É uma boa prática. Vou dar um print('Prefs Token: $prefsToken');. Agora vamos brincar de fazer condições, colocarmos isso dentro de uma condição para sabermos se já existe ou não o token.

[05:09] Leonardo Marinho: Exatamente. É aqui que vamos definir se vamos enviar ou não o token para a função sendDevice. O que temos que testar? Temos que testar basicamente se o Prefs Token é diferente do atual, é o primeiro teste. Então se o token que acabou de vir for diferente do último token que nós temos salvo, é sinal que ele é um token novo, é um token diferente.

[05:30] Nós temos que enviar para a aplicação. Outra coisa que temos que testar também é caso ele seja igual, ou seja, se o token que acabou de vir é igual ao que está salvo no Prefs Token, mas se não enviamos, por exemplo, se o prefSent está falso. O que isso quer dizer?

[05:49] Quer dizer que na última vez nós recebemos esse token, salvamos ele, mas na hora de tentar enviar para a API, deu algum erro de envio no HTTP, acontece, é comunicação, e, por algum motivo, ele não enviou, mas ele ficou salvo na memória deste último token, e temos que enviar ele agora. Então é esse o teste que vamos fazer.

[06:06] Kako: Deixa eu ver se entendi. Temos que pegar aqui o nosso if(prefsToken), o nosso token. E comparar para ver se ele é igual ao token atual que nós temos, if(prefsToken != token ||()).

[06:16] Leonardo Marinho: Exato. Se ele for diferente, nós temos que enviar, porque ele é um token novo.

[06:22] Kako: Ou temos que comparar para ver se o token foi enviado.

[06:27] Leonardo Marinho: Exatamente. De repente temos o token local, mas ele só não foi enviado ainda por algum problema web, alguma coisa HTTP que pode ter acontecido. O que nós fazemos? Testamos se ele é igual e se o prefSent está falso.

[06:39] Kako: Então if(prefsToken != token ||(prefsToken == token && prefSent ==false)). Temos a nossa condição. Nós vamos botar alguma coisa bonita dentro desse if. A primeira coisa que eu quero botar é um print(' '), porque vocês me conhecem.

[06:55] Leonardo Marinho: Claro.

[06:55] Kako: Eu adoro botar um print. Vou botar aqui: print('Enviando o token para o servidor...');, ou alguma coisa do tipo.

[07:01] Leonardo Marinho: Porque assim conseguimos saber exatamente quando entrou nessa função, para sabermos se o token é igual, se é diferente, e isso é visível, é tranquilo de conseguirmos perceber. Conforme for rodando o aplicativo, você vai notar que algumas vezes o token se repete, ele não renova sempre o token. E você vai perceber: dessa vez não enviou. Você vai olhar o log do token, é porque é igual ao último, entende?

[07:20] Kako: Então aqui eu vou pegar tudo isso do nosso device, a nossa condição if. Tudo, até esse final, o sendDevice(device);.

[07:29] Leonardo Marinho: Isso.

[07:29] Kako: Dou um "Ctrl + X", o famoso cortar, e vou colocar dentro dessa condição que estamos fazendo.

[07:36] Leonardo Marinho: Perfeito.

[07:37] Kako: A condição que acabamos de criar, a condição dos tokens estarem enviados ou não.

[07:41] Leonardo Marinho: Perfeito. Agora, Kako, vamos pensar o seguinte: ali nós testamos, na segunda condição, se temos o prefsToken e se o prefsToken é igual ao atual, que o Firebase Cloud Messaging mandou e se o prefSent for falso. Mas espera, nós não controlamos esse sent. E muito menos estamos atribuindo ao prefsToken de onde ele vem. Então, como fazemos isso? Onde podemos fazer isso? Qual é a próxima ação?

[08:14] Kako: Eu acho que é podermos pegar os dados do shared preferences e saber se esse token já existe.

[08:21] Leonardo Marinho: Perfeitamente. Então o que vamos fazer? Vamos no sendDevice.

[08:26] Kako: No sendDevice do web dart, não é?

[08:28] Leonardo Marinho: Isso. O que vamos fazer? Onde estamos enviando para a API, vamos tratar esse token. Então nós atribuímos esse token que nós recebemos para o shared preferences e forçamos, dizendo que o sentToken é falso. Por quê? Porque quem vai dizer que o sentToken é verdadeiro é a requisição dando status 200.

[08:48] Ou seja, a requisição bem sucedida. Então, já que o servidor retornou: recebi a requisição, eu tenho o token. É aqui que temos que dizer: ótimo, enviou. E vamos no shared preferences e atualiza o sentToken como true, então ele foi enviado com sucesso. Esse é o controle que conseguimos ter em HTTP para saber se tudo rolou bem.

[09:09] Kako: Eu acho que eu entendi sim. A primeira coisa que eu vou fazer aqui é tirar esse // return response;, que nós tentamos usar na outra aula, mas é porque iria usar aqui, agora.

[09:19] Leonardo Marinho: Exatamente.

[09:19] Kako: Então vamos lá, a primeira coisa a fazer aqui dentro - lembrando, aqui estamos dentro do sendDevice - dentro do sendDevice, o que vamos fazer? Vamos chamar o SharedPreferences prefs =, vamos criar outro prefs, o nosso amigo prefs, falar await, quero que você pegue a instância do nosso shared preferences, = await SharedPreferences.getInstance();.

[09:42] Leonardo Marinho: Isso nós fazemos para padronizar, então você só vai chamar a shared preferences várias vezes. Bote sempre uma variável prefs, faz sempre igual, que se precisar dar manutenção é mais fácil depois.

[09:50] Kako: Isso. Então vou pegar o nosso prefs.setString() igual nós fizemos. Peguei a setString certa? Peguei.

[09:57] Leonardo Marinho: Certa.

[09:57] Kako: Então a primeira coisa que eu quero fazer é dar uma olhada no ('pushToken', ), que nós citamos no main e aqui o valor.

[10:03] Leonardo Marinho: Isso, e vamos passar o valor do token novo para ele, para salvar lá.

[10:09] Kako: Então aqui eu vou falar ('pushToken', device.token);.

[10:14] Leonardo Marinho: Isso.

[10:14] Kako: Aqui ele vai brigar um pouco, porque pode ser nulo. Como nós já tínhamos definido que não gostamos de coisas nulas, nós colocamos aqui a nossa exclamação do nosso null safety, ('pushToken', device.token!);, falando que isso pode ser nulo, o resto não pode - talvez possa ser nulo.

[10:28] Leonardo Marinho: Perfeitamente.

[10:29] Kako: Então não brigue conosco. Agora o prefs. do booleano que temos que setar, prefs.setBool(). A mesma coisa, é a vez agora do ('tokenSent', ). Tem que ter certeza de que vocês estão escrevendo certo, se escrever errado ele vai dar um bug difícil de você perceber, então confira aí. Vamos ver aqui se o valor dele é falso, ('tokenSent', false).

[10:54] Leonardo Marinho: É falso.

[10:54] Kako: Se for falso.

[10:55] Leonardo Marinho: Por quê? Porque ali está forçando o falso, então atribuímos o novo token para a variável do shared preferences, nós salvamos na memória, no disco do dispositivo token novo. E aqui estamos forçando que seja falso, nós ainda não enviamos o token. Então nós dizemos que é falso.

[11:12] Agora precisamos testar se a response, ou seja, a resposta dessa requisição enviando para a API do Dev Meetups deu um status de código 200 e nós conseguimos testar. Se não deu, você bota uma exceção: deu alguma coisa errada. E mantém o falso no tokenSent, o token não foi enviado. E se deu 200, ótimo, nós conseguimos saber que deu tudo certo e podemos botar como true, o token foi enviado com sucesso.

[11:40] Kako: Perfeito, já estou até criando aqui exceptions para nós aqui. Aqui eu fiz invertido, eu coloquei aqui que se ele não der 200, ele deu falha, if(response.statusCode != 200), porque ele pode dar outras coisas que não 200, então às vezes é meio triste aqui.

[11:55] Leonardo Marinho: Perfeito.

[11:55] Kako: Então throw Exception('Falha ao criar o dispositivo');, else{}, se der 200, beleza, olha que delícia, ele já coloca aqui o prefs.setBool(), o nosso famoso ('tokenSent', true) - true se escreve assim.

[12:15] Leonardo Marinho: True, não é treu.

[12:17] Kako: Beleza, conferindo se está tudo certo. Tudo certo, bonito.

[12:22] Leonardo Marinho: Certo.

[12:23] Kako: É isso.

[12:23] Leonardo Marinho: Então agora nós precisamos botar a aplicação do Dev Meetups API web para se comunicar com o Firebase e é isso o que vamos fazer no próximo vídeo.

[12:32] Kako: Valeu, galera.

[12:34] Leonardo Marinho: Valeu.

@@05
Importância do Token

Já vimos que nosso servidor pode receber informações do nosso dispositivo, assim como nosso dispositivo pode enviar informações para o servidor e para o FCM (Fire Cloud Messaging).
Considerando o que aprendemos até aqui, nosso servidor consegue se comunicar diretamente com o FCM?

Sim, podemos mandar notificações direto para o FCM.
 
Alternativa correta
Sim, temos a opção de enviar informações do dispositivo direto pro FCM.
 
Alternativa correta
Não, ainda não implementamos nenhuma conexão direta entre os dois.
 
Alternativa correta! Precisamos implementar ainda uma forma do nosso Dev Meetups conversar diretamente com o Firebase Cloud Messaging.
Alternativa correta
Não, impossível fazer uma conexão direta entre o FCM e o nosso Dev Meetups.

@@06
Integrando aplicação web com o FCM

[00:00] Leonardo Marinho: Agora terminamos, em teoria, a nossa integração com a API do Dev Meetups. Agora o Dev Meetups recebe token e conseguimos testar se o token já foi enviado ou não, para eu não enviar mais de uma vez. Agora temos que testar, de fato, se isso que nós implementamos está funcionando e também fazer o Dev Meetups API web se comunicar com o Firebase Cloud Messaging.
[00:21] Até agora nós falamos e falamos, e não tivemos notificações de push nenhuma aparecendo. Então nós temos que integrar com o Firebase Cloud Messaging para podermos enviar realmente as notificações e ver uma notificação bem legal chegando no emulador. Vale ressaltar o seguinte: no emulador iOS não chega notificações de push.

[00:36] Se você for desenvolver para Apple, estiver estudando isso por fora, você vai precisar de um iPhone. Para Android, o emulador Android é um pai e uma mãe juntos, então ele aceita, nós conseguimos testar no emulador e também no dispositivo físico Android, caso você rode o aplicativo por ele. Kako, vamos testar?

[00:54] Kako: Vamos testar. Só quero que vocês deem uma olhada no nosso Dev Meetups, que temos um dispositivo com um token.

[01:00] Está salvo? Vamos rodar e vamos ver o que acontece. Lembrando que para rodar, para fazer as paradas funcionarem certas, stop, hammer time, e run de novo.

[01:14] Leonardo Marinho: Sempre. O stop é muito importante, porque o hot start, o hot reload do Flutter, ele é meio esperto, então ele só recarrega o que precisa recarregar localmente na tela, mas ele não roda novamente aquele construtor do main, o run app não roda novamente.

[01:28] Nós precisamos que o run app rode para poder pegar o token, por isso que você tem que fechar a aplicação e rodar de novo. Vale sempre reforçar isso.

[01:36] Kako: Vamos dar uma olhada aqui. Rodou. Vamos dar uma olhada no nosso Dev Meetups. Está aqui. Então já salvou o nosso amigo token, não rodou de novo, não criou um novo. Vou conferir aqui. Dê uma olhada no log e vamos ver o que está lá. O nosso token, prefsToken de nulo, enviando o token.

[01:59] Leonardo Marinho: O prefsToken nulo é porque é a primeira vez que está abrindo com o prefsToken funcionando. A próxima vez já terá um token salvo, como foi a primeira vez que nós colocamos ele, está nulo, é como se tivesse acabado de instalar o aplicativo.

[02:12] Kako: Quer que rode de novo, alguma do tipo? Ou podemos continuar?

[02:17] Leonardo Marinho: Se quiser rodar mais uma vez para testar se vem um token novo, mas é meio aleatório, tem hora que vem, tem hora que não vem.

[02:21] Kako: E também vai demorar para se comunicar com o servidor. Eu vou fazer aqui, só para deixarmos esse desencargo de consciência. Agora ele tem aqui, rodou. Tem o token e tem o prefsToken. Está vendo? É o mesmo, "ebk5b", "ebk5b". Fechou.

[02:44] Leonardo Marinho: Beleza.

[02:45] Kako: Acaba com "xc", acaba com "xc", o resto, se vocês quiserem conferir, fiquem à vontade, eu não vou conferir não. Mas está aqui, salvo no shared preferences, comparado, beleza. Agora no Dev Meetups, nos nossos dispositivos, está aqui o nosso dispositivo com o nosso token salvo. Se você abrir com outro dispositivo, vai gerar outro token e etc.

[03:02] Leonardo Marinho: Perfeitamente.

[03:02] Kako: Agora comunicar com o nosso Firebase. A primeira coisa que temos que fazer é ir no nosso Firebase Console.

[03:12] Vamos no Firebase Console e temos aqui o nosso projeto, que é o "dev-meetups", que nós criamos. Uma vez que estamos no nosso projeto "dev-meetups", para configurarmos o nosso Firebase Cloud Messaging, temos que ir no menu lateral esquerdo, na engrenagem, a project settings, em português, configurações do projeto.

[03:32] Clique em "Project settings", vocês vão ver um bocado de abas diferentes aqui, para você brincar, mas vamos nessa "Service accounts".

[03:42] Leonardo Marinho: Contas de serviço.

[03:42] Kako: Isso, obrigado. É uma facilidade com o inglês que em português não vai. Aqui, no "Service accounts", nas contas de serviço, vocês vão ver que ele cria um arquivo em "Node.js" para você e ele vai te dar a opção de criar uma chave privada.

[04:02] Você vai clicar nesse botão "Generate new private key". Tem algumas coisas importantes para que você saiba sobre essa chave privada: não compartilhe essa chave privada. Ela é sua, não pode deixar ela pública, para o pessoal ver, senão você vai dar acesso para o pessoal mexer no token dos outros, mandando notificação para celular dos outros, e isso não é seguro.

[04:23] Então gere a sua key, ele vai baixar para você. Não adianta tentar abrir, é um tipo de arquivo JSON aqui, é difícil de entender. Vou dar um "Ctrl + X" nesse arquivo e eu vou colar esse arquivo na nossa pasta do Dev Meetups. Lembra quando abrimos o Dev Meetups pela primeira vez, que tinha o "database", tem o "firebase"?

[04:50] Pois é, vou clicar no nosso "firebase" e vou colar na nossa pasta o nosso documento, a nossa chave privada, bem nessa pasta "firebase".

[05:05] Leonardo Marinho: Detalhe: o nome do arquivo não importa, você botar com qualquer nome que vier que ele vai reconhecer.

[05:10] Kako: Vou fechar a pasta, vou diminuir, para não termos esse problema. O arquivo está lá dentro. “E aí, Kako, o que mudou?” O que mudou, vamos dar uma olhada no nosso Dev Meetups, no nosso servidor.

[05:20] Aqui nós temos "Eventos", "Mensagens" e "Dispositivos". O nosso "Mensagens", antigamente, quando nós clicávamos, estava aqui: “Firebase não configurado”. Mas nós acabamos de configurar, e agora? Vou clicar no botão "Atualizar" e pronto.

[05:33] Leonardo Marinho: Olha que legal, temos uma tela nova. Essa tela nova, nós vamos entender um pouco melhor ela, na prática, nos próximos vídeos. Mas, o que já podemos fazer, é em "Notificação" colocar um título de uma mensagem de algo que acontece. Kako, kako.

[05:57] Kako: "O Léo é lindo!", "Um cara muito lindo!". Vou criar essa notificação aqui e vou clicar em "Enviar".

[06:02] Leonardo Marinho: Até parece.

[06:06] Kako: Cliquei em enviar. Ué, não deu nada aqui no emulador.

[06:10] Leonardo Marinho: E agora?

[06:13] Kako: Se eu vier aqui, barra de notificações.

[06:14] Leonardo Marinho: Aí é que está o conto do vigário, a pegadinha. Notificação de push chega mais ou menos na hora que ela quer, não na hora que você quer. Então pode ser que chegue agora, pode ser que leve 2, 3 minutos. Geralmente chega um pouco mais rápido, mas geralmente, quando estamos gravando o vídeo, para passarmos vergonha, ela demora. Mas acontece. Quer ver, Kako? Tente disparar também com "Dados".

[06:38] Kako: Com "Dados"?

[06:38] Leonardo Marinho: É, vamos disparando várias vezes, porque com o vídeo vai acabar aparecendo.

[06:44] Kako. "Teste". Vou mandar "Dados".

[06:49] Leonardo Marinho: Vamos ver se chega. Também não.

[06:50] Kako: Ainda não.

[06:51] Leonardo Marinho: Assim, pessoal, isso acontece, é normal, a notificação nem sempre chega de primeira, mas teste no seu, às vezes vai chegar, às vezes não vai, depende muito de velocidade de servidor, processamento de servidor, o tempo que leva entre a requisição chegar no Firebase e Firebase enviar para o seu dispositivo móvel. Isso é bem variável, então tem hora que aparece de primeira, tem hora que não aparece de primeira, é isso.

[07:12] Kako: Mas e aí? Isso é meio complicado, como é que vamos saber que mandou de fato? Eu vou te mostrar agora. Você vai abrir o seu CMD, que você deixou aberto o servidor do Dev Meetups, vou arrastar ele aqui para você poder ver. Você vai dar uma olhada no que ele está falando para você. Olha só, nas últimas três coisas, ele já tem aqui uma coisa que ele mandou para o Firebase Data, está aqui o título.

[07:37] Está difícil de ler, porque ele não tem acentos como o É, mas está aqui, “O Léo é lindo, um cara muito lindo”. Depois ele mandou teste, teste 1, teste 2, teste. Foram mandados, não tivemos problema no envio dessas mensagens, elas vão chegar, no tempo delas, mas vão chegar.

[07:56] Leonardo Marinho: Beleza. Abra o emulador de novo, Kako, vamos dar uma olhada.

[07:59] Kako: Vamos dar uma olhada.

[08:01] Leonardo Marinho: Beleza. Ainda não recebemos. O que podemos fazer é o seguinte, de repente a notificação está chegando no dispositivo, mas como o aplicativo está aberto, o aplicativo está captando a notificação e não está exibindo. Então uma coisa que podemos fazer também é fechar o aplicativo, zerar o aplicativo.

[08:15] Kako: É uma boa. Vamos lá. Vou fechar aqui.

[08:19] Leonardo Marinho: Olha só, repare ali embaixo, que o Firebase já está dizendo que ele está recebendo uma mensagem.

[08:23] Então ele está recebendo a mensagem, ele só não está exibindo aquele balãozinho porque o aplicativo está aberto. Nós chamamos isso de modo foreground, nós vamos ver isso nos próximos vídeos.

[08:33] Kako: Então eu paro?

[08:35] Leonardo Marinho: Pare o aplicativo, zere o aplicativo.

[08:37] Kako: Vamos zerar. Diminuir isso aqui. Rodar de novo? Rodar de novo.

[08:40] Leonardo Marinho: Esse tipo de coisa tem como tratar e nós vamos aprender a tratar. Rode - não, não precisa rodar.

[08:46] Kako: Não precisa rodar? Eu já tinha posto para rodar.

[08:47] Leonardo Marinho: Não precisa rodar. Aqui é a coisa legal, você não precisa rodar. Feche o aplicativo completamente, vamos simular que você está com fome.

[08:52] Kako: Completamente.

[08:52] Leonardo Marinho: É uma sexta-feira e você está no seu aplicativo, fazendo qualquer coisa aleatória que não esteja com aplicativo de comida, ou qualquer coisa do gênero, aberto.

[09:00] Kako: Não precisa simular não, estou com fome.

[09:01] Leonardo Marinho: E o seu aplicativo quer mandar um cupom de alguma coisa de desconto. Então faz sentido o seu aplicativo estar fechado, é o fluxo natural do que vai acontecer. Agora mande uma notificação e vamos ver se ela vai chegar, porque o aplicativo estava constando no terminal, no console de log, que estava recebendo uma mensagem.

[09:22] Kako: Perfeito.

[09:23] Leonardo Marinho: Só não estava exibindo justamente porque estava aberto, e não estávamos tratando exatamente isso.

[09:28] Kako: Vamos testar aqui, "Notificação", "Comida grátis", "Você acabou de ganhar comida", parabéns. Botei para enviar.

[09:34] Leonardo Marinho: Beleza.

[09:34] Kako: Apareceu um negócio aqui. Eu acabei de ganhar comida grátis.

[09:41] Leonardo Marinho: Olha que legal, chegou a nossa notificação de push. Todo o fluxo de passar o token para aplicação web, configurar a aplicação web para se comunicar com o Firebase Cloud Messaging agora aconteceu. Se você apertar essa notificação, ela abre o aplicativo.

[09:53] Kako: Que coisa maravilhosa, cara.

[09:55] Leonardo Marinho: Maneiro ver a coisa funcionando.

[09:57] Kako: Muito maneiro.

[09:58] Leonardo Marinho: E você deve perguntar: Mas, Léo, mas, Kako, aquele "Dados" no Dev Meetups serve para o quê? Eu consigo passar dados, eu consigo pegar dados da notificação? E se eu estiver com o aplicativo aberto, a notificação não vai acontecer? Como é que eu vou fazer?

[10:12] Eu te digo: calma, porque agora vamos começar a trabalhar como tratar esse tipo de coisa. Nós conseguimos tratar uma notificação quando ela chega em background, quando ela chega em foreground, quando o aplicativo está fechado, nós conseguimos passar dados para essa notificação, tudo isso nós vamos ver daqui em diante.

[10:28] Kako: Perfeito, galera.

[10:31] Leonardo Marinho: Era isso, estamos felizes, temos a notificação de push.

[10:33] Kako: Comida. Valeu, galera.

[10:36] Leonardo Marinho: Valeu.

[10:37] Kako: Até o próximo vídeo.

@@07
Faça como eu fiz

Chegou a hora de você seguir todos os passos realizados por mim durante esta aula. Caso já tenha feito, excelente. Se ainda não, é importante que você execute o que foi visto nos vídeos para poder continuar com a próxima aula.

Continue com os seus estudos, e se houver dúvidas, não hesite em recorrer ao nosso fórum!

@@08
O que aprendemos?

Nesta aula, você aprendeu sobre:
Enviar dados para o Servidor
Revimos como fazer uma comunicação HTTP com o servidor e usar a função .POST para enviar dados, do dispositivo para o servidor, com o protocolo correto.
Descobrir informações sobre o dispositivo do usuário
Usamos um novo pacote (device_info_plus) para descobrir informações sobre o dispositivo do usuário e podermos ter um banco de dados mais detalhado sobre cada um dos nossos usuários.
Importância do Token
Aprendemos que o token único para cada usuário é imprescindível, e que é importante que o dispositivo do usuário salve esse token para que ele não mude sem necessidade, pois isso confundiria nossa análise de dados.
Comunicação entre servidor e FCM
Descobrimos como é fácil integrar o FCM com um servidor dedicado e isso nos permite enviar notificações e dados para os dispositivos cadastrados no servidor.

#### 13/01/2024

@02-Trabalhando com notificações

@@01
Projeto da aula anterior

Caso queira, você pode baixar aqui o projeto do curso no ponto em que paramos na aula anterior.

https://github.com/alura-cursos/flutter-notifications/tree/aula_2

@@02
Permissões

[00:00] Leonardo Marinho: Agora nós precisamos tratar uma coisa muito importante nas notificações, que é a permissão delas. O emulador do Android normalmente libera permissão para nós, então não precisamos nos preocupar tanto com isso, é instalarmos o aplicativo e a permissão já está dada. Ou, às vezes, ele pergunta se você deseja dar permissão para o aplicativo receber, de fato, notificações.
[00:21] Mas essa não é a realidade dos aplicativos móveis. Geralmente algumas versões do Android vão perguntar se você quer sim dar permissão para receber notificações e aplicativos, principalmente os que trabalham com Apple, com iOS, vão sempre perguntar se você quer receber notificações ou não.

[00:37] Da forma que nós deixamos o nosso código, nós não garantimos que o aplicativo vai perguntar à pessoa se ela deseja dar permissão ou não, nós estaríamos sempre considerando que teria permissão. Se não tiver, simplesmente daria crash, iria quebrar, iria dar um erro, não iria funcionar direito, e não é isso o que nós queremos.

[00:54] Agora nós precisamos tratar o esquema de permissões. Em cima disso, então, eu e Kako vamos te mostrar aqui como fazer isso, como podemos codar a permissão, como podemos testar o tipo de permissão, considerando que temos três estágios: permissão autorizada, ou seja, a pessoa nos deu permissão para enviar notificação; permissão provisória, ou seja, ela só deu permissão para aquela vez que ela abriu o aplicativo.

[01:19] Então na próxima vez não temos mais essa permissão, nós teríamos que pedir de novo. E a terceira é não permitido, então não temos permissão nenhuma para enviar notificações, e não faria sentido pegar o token de autenticação, nada disso. Então Kako, vamos lá, como começamos a fazer isso?

[01:35] Kako: Vamos lá. Vamos fazer o seguinte, abra o seu código, vamos no "main.dart". Lembra da nossa função main, que nós fizemos todo o setup do Firebase, etc.?

[01:44] Aqui nós temos o nosso String? token, toda a funcionalidade do token, criar o token, mandar o token, etc., printar o token se quiser ver. Vou cortar isso, eu quero criar um método disso. Eu vou vir aqui, "Ctrl + Alt + M", vou criar um método. Vou chamar ele de _startPushNotificationsHandler, nome bonito. Vou dar uma refatorada nele. Vamos ver onde ele está lá embaixo agora. Está aqui.

[02:18] Eu não preciso que ele seja um future não, eu quero que ele seja void mesmo. Ele criou o future aqui porque já era assíncrono. Então vou até tirar desse _startPushNotificationHandler(messaging) aqui de cima, esse await, por um segundo. Vamos só conferir se está tudo certo aqui: ele é assíncrono, ele está recebendo uma mensagem e ele está enviando um token.

[02:42] Vou botar esse _setPushToken(token); como privado, para não termos problema no futuro. Eu acho que faltou alguma coisa aqui, ele já está chorando comigo, porque ele não gosta mesmo, então paciência, vou deixar ele normal. A primeira coisa que nós fizemos foi criar a nossa função _startPushNotificationHandler. Por quê?

[03:02] Eu não quero deixar a função main poluída, cheia de coisa aqui. Daqui a pouco vocês vão ver que vamos usar muito essa mensagem de token, então isso já facilita bastante. Agora vamos começar a brincar com as notificações, com as permissões das notificações. Primeiramente, vamos lá.

[03:23] Leonardo Marinho: Kako, é legal ressaltar o seguinte: por que nós criamos essa função? Já não estava bom ali, onde estava, não estava funcionando? Estava. Mas pense o seguinte, se o usuário não der permissão, eu não quero ter notificação de maneira nenhuma, faz sentido gastarmos tráfego de rede para pedir ao Firebase um token que não poderemos usar?

[03:45] Kako: É, não faz sentido.

[03:46] Leonardo Marinho: Não faz sentido. Então nós criamos uma função, separamos esse trecho de código para ele não ser executado sempre, para só executarmos ele quando tivermos permissão, de fato, de usar a notificação. Nós otimizamos essa parte, por isso criamos essa função.

[03:58] Kako: Perfeito. Por enquanto eu vou deixar ele aqui, mas só para sabermos que ainda é utilizado, não mudou nada no nosso código. Vamos lá, a primeira coisa, eu vou mandar aqui o NotificationSettings e vou criar um cara chamado NotificationSettings settings =. Ele vai receber uma função assíncrona, uma mensagem vinda do nosso Firebase.

[04:30] Ele vai perguntar para uma permissão. Deixa eu só ver se não está faltando nada, aparentemente não. = await messaging.requestPermission(), você vai pedir essa permissão. Mas nessa permissão nós podemos botar um bocado de coisa dentro dela, nós podemos colocar, por exemplo, eu quero saber se terá um alerta para o usuário dar essa permissão, alert: true,.

[04:54] Eu quero mandar um anúncio - eu não quero mandar esse anúncio para a pessoa, então vou colocar announcement: false, e não flase. Tem muitas coisas aqui, tem badge, tem card play, tem critical alert, provisional sound, isso tudo, vamos botar tudo aqui. Vamos brincar aqui, badge: - queremos uma badge? Vamos botar uma badge: true, na nossa request de permissão.

[05:26] Leonardo Marinho: Essa parte da badge é legal porque, por exemplo, algumas versões do Android mais recentes, quando você recebe uma notificação e você ainda não abriu, fica aquele 1 no ícone do aplicativo. Isso é bem legal, porque mostra que tem uma notificação pendurada ali. O badge é isso.

[05:40] criticalAlert: false,, nós podemos dizer que é um alerta crítico, é uma notificação de prioridade, enfim, tem uma série de coisas que você pode configurar, que eu recomendo, com calma, abrir a classe, ver cada atributo, ver a documentação, para que cada um serve, e você personaliza do jeito que você quer.

[05:57] Por exemplo, o sound, quando chega a notificação, você decide se ela vai fazer o barulho ou se ela vai chegar quieta no celular, vai chegar muda. Normalmente nós botamos sound: true,, porque você está mandando uma notificação, você quer que a pessoa saiba que ela chegou.

[06:08] Kako: Exatamente. Olha, eu não estou puxando do nada aqui não. Quando você começa a escrever aqui, dentro do requestPermission, ele já te fala aqui todos os parâmetros que você pode usar, setar. Eu já tenho aqui tudo certo, eu fui lendo e escrevendo, para colocar eles no nosso NotificationSettings.

[06:33] Agora temos que usar o nosso settings, temos que usar ele. Vamos usar ele para quê? Vamos usar ele como uma condição para compararmos se foi autorizado, se teve permissão, se não teve permissão. Agora começa a mágica. Vamos lá, vou criar um if para a nossa condição.

[06:54] Eu vou vir aqui, eu quero pegar o nosso settings e eu quero saber o status da nossa autorização, então if(settings.authorizationStatus ==). O que eu vou fazer com isso? Eu vou dar uma comparada. Vou comparar com o quê? Vou comparar com == AuthorizationStatus.authorized. Eu sei que isso aqui é uma instância que já fala: está autorizado. Se isso, se o nosso settings for igual a autorizado, vamos fazer alguma coisa.

[07:24] Leonardo Marinho: Basicamente ele é uma constante, não é, Kako?

[07:27] Kako: Isso.

[07:28] Leonardo Marinho: O primeiro é qual é o status atual e a segunda é uma constante, que já está ali dentro para você comparar se é igual ou não é, o como funciona.

[07:34] Kako: Exatamente. Para variar, vou colocar um print(' '); aqui, só para sabermos se a coisa funcionou. Vamos botar ('Permissão concedida pelo usuário: '). Estou escrevendo certo? Estou escrevendo certo. E já vou mandar aqui, para termos certeza de que foi autorizado mesmo.

[07:51] Vou mandar aqui : ${settings.authorizationStatus}, só para podermos ver a coisa acontecendo. Deixa eu fechar o menu lateral para você poder ver melhor. Mas é isso, eu vou mandar um print? Não, agora nós precisamos o quê? Fazer o nosso token, o nosso _startPushNotificationHandler(messaging);. Já vou dar um "Ctrl + X" nessa linha e colocar ele dentro do nosso if.

[Aula3_video1_imagem2]

[08:13] Então se estiver autorizado, vou fazer o token, se não estiver, não vou fazer. Vamos continuar as nossas condições aqui. Agora temos que fazer outra condição, porque não existem só duas condições, a condição de autorizado e não autorizado. Existe um provisório. Léo, fale um pouco sobre o provisório enquanto eu faço essa condição.

[08:38] Leonardo Marinho: Para ilustrarmos melhor o provisório, basicamente o provisório é quando a pessoa abre o aplicativo, não quer dar sempre aquela permissão, mas por algum motivo, naquela execução do aplicativo, ela quer liberar a permissão. Por exemplo, nós usamos geralmente muito isso com localização de GPS.

[08:57] Você abre o aplicativo, ele pergunta: você quer liberar a posição de GPS? Você olha, você fala: eu não estou muito afim de liberar essa permissão para esse aplicativo não, mas como dessa vez eu preciso usar, eu vou liberar. Você coloca apenas dessa vez - depende, cada sistema operacional dá uma frase diferente.

[09:12] Mas geralmente é liberar o uso só naquela execução do aplicativo. Se você fechar ele, quando abrir de novo ele vai perguntar: você dá permissão? Você dá permissão? Até você dar um sim para sempre ou um não para sempre, então ele nunca mais pergunta. Mas, enquanto você usar o provisório, todas as vezes ele vai perguntar: desta vez você quer dar permissão? E caí nesse teste que o Kako está escrevendo.

[09:31] Porque nós podemos enviar a notificação se ele der a permissão provisória, e nós podemos tratar. No nosso caso, só estamos dando um print e fazendo a mesma chamada. Por que você não faz um if com OU e coloca?

[00:09:44] Poderia também, mas nós queremos separar, porque caso você deseje tratar de maneira diferente uma permissão provisória, que é o que pode acontecer, você de repente quer fazer alguma coisa que gere um certo apelo para o seu usuário liberar a permissão definitivamente, é ali o lugar em que você vai fazer isso.

[10:00] É assim que você pega. E também tem um else ali, que ele criou agora, que é caso não tenha permissão nenhuma, que não faz sentido nenhum você buscar o token, como nós já falamos.

[10:09] Kako: Exatamente. Muito simples, galera, muito simples. Mesmo esquema, eu peguei o settings, o status da autorização e comparei dessa vez, em vez do authorized, comparei com o AuthorizationStatus.provisional, que é o provisório. Tranquilo, ainda continuamos fazendo o token.

[10:25] Mas, caso não seja aceito nem para sempre e nem só provisório, não conseguimos fazer nada. Não mandamos o token, não fazemos nada, ficamos devendo, é isso, o aplicativo, para aquele usuário, não vai ter comunicação, não vai ter notificação, e paciência.

[10:42] Leonardo Marinho: Paciência, que é respeito à privacidade de dados. Às vezes queremos impor as coisas, têm leis que protegem isso e também é o mínimo que se espera que um aplicativo respeite a sua vontade. Se o usuário não der permissão, paciência, você não vai poder enviar notificação, use a sua criatividade para fazer de outra forma que não invada também o espaço e a privacidade do usuário.

[11:02] Kako: Exatamente. Lembrando aqui, galera, só aquele papo de sempre: refatoração é sempre maravilhoso. Olha só, eu só precisei usar o startPushNotificationHandler aqui. Não precisava se eu não quisesse, eu não precisava ter criado esse método. Eu podia simplesmente vir aqui e usar essa função inteira em vez do método. Só que olha que coisa feia.

[11:23] Olha o tanto de lixo que estamos acumulando, olha o tanto de coisa. Não é bonito. Refatore, seu código vai ficar mais legível, mais entendível e mais eficiente.

[11:32] Leonardo Marinho: Perfeitamente. Agora precisamos estudar um problema que aconteceu há alguns vídeos atrás, que foi de o aplicativo estar aberto, nós enviarmos uma notificação e não recebermos nada. Quando nós fomos no console, no terminal, nós vimos que rolou um log de uma notificação que foi recebida, mas não vimos nada. Agora vamos aprender a tratar isso, porque isso acontece, quais são as diferenças.

[11:55] Kako: Perfeito. Então na próxima aula.

[11:57] Leonardo Marinho: Isso aí.

[11:58] Kako: Valeu.

[11:58] Leonardo Marinho: Valeu, galera.

@@03
Foreground

[00:00] Leonardo Marinho: Então vamos tratar agora um problema que nós vimos lá atrás, mas não entendemos bem o que aconteceu e ficamos assim, e tal, fechamos o aplicativo e quando fechamos, a notificação chegou.
[00:09] Se você lembra bem, lá nas primeiras aulas, nos primeiros vídeos, quando estudamos como integrava com o servidor e vimos a parte de ponta a ponta, de disparar a notificação do servidor e chegar no celular, deu uma agarrada na hora que testamos. Nós ficamos: não chegou nada no aplicativo, está enviando, eu apertei enviar 10 vezes, não chegou nada. Quando fechamos o aplicativo, a notificação apareceu. Por que isso acontece?

[00:33] Porque quando o aplicativo está aberto, nós chamamos isso de foreground, é o primeiro plano. Quando você está com o aplicativo em primeiro plano, ele recebe, mas ele não mostra aquela notificação na barra superior, porque ele entende que você já está vendo ele, não tem porque você gerar uma notificação no sistema operacional para fazer você abrir o aplicativo, sendo que ele já está aberto.

[00:54] O sistema operacional entende que ele não precisa mostrar uma notificação para você e que sim, o aplicativo vai tratar já o recebimento desta notificação. Então se nós não tratarmos, nós vamos perder a notificação, o usuário nunca vai saber que aquilo chegou, mesmo tendo chegado no aplicativo.

[01:08] Nós temos que fazer um tratamento em foreground para ele receber esses dados. Eu e o Kako vamos mostrar um pouco como conseguimos tratar, receber dado, mostrar esse dado que nós recebemos, e ver a coisa toda funcionando.

[01:24] Kako: Aqui, vamos fazer aquela brincadeira que rolou da última vez. Só para mostrarmos o problema, está aqui aberto o aplicativo no emulador, está em foreground, está em primeiro plano.

[01:36] Eu vou tentar mandar uma mensagem pelo nosso Dev Meetups. Eu vou mandar uma mensagem aqui. Fale uma mensagem, Léo, eu estou sem criatividade hoje.

[01:46] Leonardo Marinho: Hoje tem Meetup com cookies.

[01:53] Kako: Não sei escrever cookies. Eu não sei escrever cookies.

[01:57] Leonardo Marinho: Tem dois Os, cookies. Isso.

[01:59] Kako: Assim? Então está bom. Vamos lá.

[02:03] Leonardo Marinho: Vamos lá.

[02:03] Kako: Pronto. Vou enviar. Foi enviado.

[02:07] Leonardo Marinho: Foi enviado.

[02:07] Kako: Vamos dar uma olhada no nosso aplicativo. Não chegou.

[02:10] Leonardo Marinho: Zero notificações.

[02:10] Kako: Vamos conferir. Tem alguma coisa aqui? No nosso servidor tem aqui.

[02:16] send notification, profile base, com o título "hoje tem cookies", "oba". Foi enviado. Vamos dar uma olhada no nosso Android Studio? Está aqui. “Broadcast received for message”. Foi recebido. Então foi criado, foi enviado, foi recebido, mas não apareceu.

[02:37] Leonardo Marinho: E pegamos até quem está mostrando, ali, "D/FLTFireMsgReceiver". É o Firebase Message Receiver te avisando: eu recebi uma parada aqui, mas eu não sei o que é isso não.

[02:47] Kako: Exatamente.

[02:48] Leonardo Marinho: Agora nós temos que tratar ele.

[02:49] Kako: Vamos lá. Para tratarmos, vamos voltar na nossa super função que fizemos na última aula, startPushNotificationsHandler.

[02:58] Nela nós vamos criar mais uma função aqui dentro, para nos ajudar - deixa eu diminuir essa parte debaixo para termos espaço - nos ajudar a lidar com esse foreground. Vamos lá. Aqui eu vou criar uma instância Firebase Messaging - aqui ele está pedindo o messaging, então eu vou escrever certo, FirebaseMessaging, vou nesse debaixo, que é mais fácil.

[03:27] FirebaseMessaging.onMessage. Eu vou pedir para ele dar um onMessage.listen((){}), para ele ficar ouvindo se a mensagem chegou. A primeira coisa que ele pede é o evento, então até aqui tranquilo. Esse evento eu vou chamar ele de ((RemoteMessage message), eu vou chamar ele de message.

[03:50] Leonardo Marinho: Porque é o tipo do retorno que vem para nós.

[03:53] Kako: Exatamente, vamos dar um "Enter" aqui. A primeira coisa que eu vou fazer aqui é colocar um print(' ');, que você já me conhece, eu tenho que fazer um print para eu poder analisar se as coisas estão saindo certas no nosso run, é uma boa prática também para quando você está desenvolvendo. Depois que acabar de desenvolver, é até uma boa você tirar.

[04:09] Vamos lá, ('Recebi uma mensagem enquanto estava com o App aberto!');. Escrevi tudo certo. Vou botar mais um print(' ');, só para recebermos o dado mesmo, para darmos uma olhada nesse dado aqui. eu vou botar aqui print('Dados da mensagem: ${}'). Para colocar os dados, coloco um cifrão, chaves quando os dados forem compostos. Então ${message.data}. É isso mesmo? É isso mesmo.

[04:50] Leonardo Marinho: É isso aí.

[04:51] Kako: Ficou faltando alguma coisa? Não, só está faltando um ponto e vírgula aqui.

[04:53] Leonardo Marinho: Um ponto e vírgula.

[04:54] Kako: Obrigado.

[04:54] Leonardo Marinho: E um M ali, no mensagem, porque o meu TOC agradece muito.

[05:00] Kako: Obrigado. Perfeito. Agora, só para finalizar, uma condição. Uma condição para caso a mensagem.

[05:11] Leonardo Marinho: Tenha dados.

[05:12] Kako: É isso.

[05:12] Leonardo Marinho: Isso é legal por quê? Volta no Dev Meetups, Kako, bem rápido.

[05:16] Kako: Aqui, Dev Meetups.

[05:18] Leonardo Marinho: A notificação de push, nos dá uma opção de passar dados dentro dela. Então além do título da mensagem, podemos passar uma chave e valor. Então, se você quiser no valor até passar um objeto JSON, ou coisas assim, você pode, isso passar internamente, é por baixo dos panos.

[05:32] Quando a notificação chega no celular, você consegue capturar esses dados e tomar decisões. Então você pode criar um modal de mensagem, pode criar um tipo de janela específica de mensagem. Enfim, você personaliza do jeito que você quiser. Então, no Dev Meetups, ele nos dá a opção de colocar um título e uma mensagem, mas seria chave e valor, e mais para frente veremos isso no Firebase console, como funciona.

[05:52] Kako: Nossa, muito top.

[05:55] Leonardo Marinho: É muito maneiro. Então nós vamos fazer o teste agora se tem dados vindo também na notificação, porque se tiver dados, nós podemos exibir em um console, fazer alguma operação com esses dados.

[06:05] Kako: Espera, só para eu entender. Eu posso mandar uma notificação, que vai mandar a notificação do cara, da pessoa, no meu celular, ou posso mandar dados e esses dados podem ser tratados pelo aplicativo para, sei lá, construir algum componente, algum texto no aplicativo da pessoa direto?

[06:24] Leonardo Marinho: Sim, sim.

[06:25] Kako: Nossa, que barato.

[06:25] Leonardo Marinho: Isso é muito legal. Por exemplo, se você está em uma promoção ali, se a pessoa ficar até a meia noite com o aplicativo aberto, você, sei lá, vai dar algum brinde. Se a pessoa estiver com o aplicativo aberto, ela vai receber a mensagem foreground e você vai conseguir ler os dados e dar o brinde para ela. Então dá para personalizar muita coisa legal assim.

[06:45] Kako: Nossa, que massa. Então eu vou fazer aqui uma condição, caso sejam os dados. Eu venho aqui, if(message) e eu vou, ao invés de usar o data, usar o (message.notification).

[06:59] Leonardo Marinho: Sim.

[06:59] Kako: Se ele for diferente de nulo, obviamente, ele vai entrar nesse condição, if(message.notification != null), e eu vou dar o print(' '); para darmos uma olhada se tem de fato dados, ('A mensagem também continha uma notificação: ${}'). Eu vou botar aqui os nossos dados, as nossas notificações. Então aqui eu vou botar ${message.notification.title}, porque eu quero o título. E eu não quero só o título.

[07:35] Leonardo Marinho: Ali tem um detalhe: ele vai dar erro. Por quê? Porque com o Flutter 2 nós trabalhamos com o null safety.

[07:42] Kako: É verdade. Já vamos arrumar aqui.

[07:43] Leonardo Marinho: Tem que dar uma exclamação ali.

[07:45] Kako: Exclamação no ${message.notification!.title}, ${}, para dizer que às vezes ele pode ser nulo.

[07:50] Leonardo Marinho: Pois é, às vezes pode não vir um título. Não é porque veio uma notificação que quer dizer que ela tem título. Pode ter título ou mensagem ou os dois, então temos que testar, porque às vezes um ou outro podem ser nulos.

[08:00] Kako: Perfeito. Eu dei um "Ctrl + Alt + L" só para identar e continuarmos lendo aqui sem matar. Então aqui temos o título, eu vou mandar agora ${message.notification.body}. Beleza, só recapitulando aqui, eu esqueci de novo da exclamação do null safety, ${message.notification!.body}.

[08:18] Só recapitulando, nós estamos recebendo message.data, que são aqueles dados, os dados que vem da nossa aplicação e podem vir a qualquer momento, não vão avisar o usuário nem nada, são dados que podem mudar a sua aplicação e etc., e não vão notificar. E tem a notificação, que tem o título e o body, que é o que estamos recebendo aqui embaixo caso a notificação seja diferente de nula.

[08:45] Leonardo Marinho: Perfeitamente. É aquela coisa, nós podemos fazer várias combinações, você pode mandar uma notificação que tem título e mensagem e que também tenha dados, essa notificação vai aparecer para o usuário, se o aplicativo estiver fechado - e tratando aqui também, nós conseguimos fazer futuramente alguma personalização, podemos botar uma janela para abrir a mensagem e tal, sem problemas, é mega personalizável.

[09:06] Ou você pode mandar só os dados. Às vezes você quer dar um comando interno para o aplicativo sem notificar nada, só quer mandar um comando interno por algum motivo, você usa a notificação como a sua ferramenta. Ela também serve para isso. Mas tem que ter permissão e tal, é outro esquema.

[09:20] Kako: Perfeito.

[09:21] Leonardo Marinho: Mas funciona e é isso que estamos debugando aqui para mostrar.

[09:24] Kako: Perfeito. Vamos mostrar, vou dar um stop aqui.

[09:30] Leonardo Marinho: Vamos mostrar.

[09:32] Kako: Dar um stop, porque nunca se sabe, estamos mudando coisa aqui no main, estamos fazendo uma nova mensagem com o Firebase.

[09:35] Leonardo Marinho: Sim, e aqui nós fazemos e mostramos ao vivo.

[09:39] Kako: Ao vivasso.

[09:39] Leonardo Marinho: Não tem dessa não.

[09:40] Kako: O que é isso, quem sabe faz ao vivo, bicho.

[09:43] Leonardo Marinho: Esse é o gravado mais ao vivo que existe.

[09:47] Kako: Se quiser, escrevam nos comentários que nós respondemos. É brincadeira. Está buildando, esperando aqui. Foi aqui, já vieram até os dados.

[09:57] Permissão concedida pelo usuário, o token, se o token foi salvo no nosso shared preferences.

[10:05] Leonardo Marinho: É legal ressaltar que ali deu que a permissão foi concedida ou porque a primeira vez que o aplicativo foi instalado o emulador perguntou e o Kako liberou para sempre, deu aquele permitido, ou porque o emulador tem a permissão já full time, direto para isso. Então em um desses casos ele sempre vai dar permissão concedida.

[10:21] Kako: Perfeito. Então vamos testar. Temos o nosso Dev Meetups aqui, no emulador, que por algum motivo ele não está carregando. Deve ter crashado o nosso servidor. Quando o seu servidor, ele não está achando os dados e nem nada do tipo, você pode dar um "Ctrl + C" no seu servidor, no terminal, que ele reseta. Se você der um segundo "Ctrl + C", ele vai fechar. Não dê o segundo "Ctrl + C".

[10:46] Leonardo Marinho: Ele respira.

[10:47] Kako: É, ele respirou. Então vamos testar. No Dev Meetups, eu vou enviar esses dados, só de brincadeira, para saber também o que acontece, em "Dados". E eu vou enviar uma notificação também. Aqueles dados, lembrando, eu botei chave e valor.

[11:01] Leonardo Marinho: E valor. Pare, já mostre para a galera, vamos lá olhar.

[11:05] Kako: Vamos lá olhar. Vamos dar uma olhada no Android Studio, ver aqui, recebeu uma mensagem quando você estava com o app aberto. Dados, títulos chave que são valor. Não apareceu nada no emulador porque eles são dados, não é uma notificação.

[11:17] Perfeito. Aqui no nosso terminal também apareceu aqui. Vamos ver se recebe agora a nossa notificação. Aqui eu vou falar, sei lá, "eu gosto de chuva", "muita chuva", coisas aleatórias que eu gosto, eu gosto de chuva. Enviei. Eu quero olhar no terminal primeiro. Apareceu: eu gosto de chuva, muita chuva.

[11:42] Vamos ver no nosso Android Studio. Recebeu aqui, não tinha dados, a mensagem também continha uma notificação: eu gosto de chuva, muita chuva. E no emulador?

[11:53] Leonardo Marinho: Não vem nada porque está em foreground. Então a única captura que vamos conseguir é essa, a mensagem continha chuva, via dado ali. A exibição dessa mensagem para o usuário fica ao seu encargo de programar uma modificação, uma mensagem, uma modal, uma janela, um alert, qualquer coisa, para mostrar.

[12:11] Kako: Perfeito.

[12:11] Leonardo Marinho: Foreground, o sistema operacional não vai mostrar a notificação e ponto.

[12:15] Kako: Então posso fazer um dialog aqui, que já dá um pop up e aparece a mensagem, é melhor.

[12:20] Leonardo Marinho: Pode.

[12:20] Kako: Não vai receber a notificação do Android aqui, ok.

[12:23] Leonardo Marinho: Pode. O Android só se responsabiliza quando você está em background ou fechado.

[12:27] Kako: Bom saber.

[12:27] Leonardo Marinho: Então em foreground é isso o que nós conseguimos fazer. Você consegue pegar dados, se vem, e mensagem e corpo, se vem.

[12:35] Kako: Perfeito.

[12:35] Leonardo Marinho: Então nós temos essas opções, enviar um ou outro, ou os dois juntos, pode ser também.

[12:41] Kako: Sucesso então. Acho que é isso nessa aula, tudo de foreground que precisávamos saber. Na próxima aula vamos dar uma brincada com background então?

[12:49] Leonardo Marinho: Background. Então é isso, pessoal, até já.

[12:53] Kako: Até já.

@@04
É permitido codar?

Você acabou de ser contratado pela empresa dos seus sonhos! Ela quer que você trabalhe na área de permissão do aplicativo com o dispositivo, e eles te mostraram um pequeno trecho de código:
if (kIsWeb) {
        deviceData = _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
      } else {
        if (Platform.isAndroid) {
          deviceData =
              _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        } else if (Platform.isIOS) {
          deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
        } else if (Platform.isLinux) {
          deviceData = _readLinuxDeviceInfo(await deviceInfoPlugin.linuxInfo);
        } else if (Platform.isMacOS) {
          deviceData = _readMacOsDeviceInfo(await deviceInfoPlugin.macOsInfo);
        } else if (Platform.isWindows) {
          deviceData =
              _readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo);
        }
      }
COPIAR CÓDIGO
A partir deste código, quais são os dispositivos com os quais você terá que trabalhar?

Apenas Mobile: Android, iOS.
 
Incorreto, apesar de ser imprescindível termos possibilidade de trabalhar com os sistemas Mobile, não estamos presos a apenas isso.
Alternativa correta
Web, Mobile (Android e iOs), e Desktop(Linux, MacOS e Windows).
 
Alternativa correta! Isso mesmo! O código analisa o dispositivo e pode resultar em qualquer plataforma computacional popular!
Alternativa correta
Apenas Desktop: Linux, MacOS e Windows.

@@05
Background

[00:00] Leonardo Marinho: Aprendemos como configurar toda a parte de push no nosso aplicativo Flutter e já vimos também como tratar as mensagens em foreground. Mas e se, por um acaso, nós recebemos uma mensagem quando o aplicativo está em segundo plano? Ou seja, ele está minimizado e tem um outro aplicativo aberto por cima? Como tratamos exatamente isso? Tem como tratar?
[00:19] É isso o que vamos ver agora. O aplicativo, nesse modo de segundo plano, nós chamamos de background, então se você for ler a documentação do Firebase Cloud Messaging e tudo mais, vai sempre detalhar assim: terminated foreground background. Terminated é o aplicativo completamente fechado, foreground é o aplicativo, como nós vimos anteriormente, aberto, então já está aberto, só está aberto.

[00:41] E o background agora é a forma que vamos tratar, que é ele em segundo plano. Nós conseguimos monitorar se chegou alguma notificação em segundo plano e dar determinadas ações para ela. Então Kako, como nós conseguimos fazer isso no código?

[00:54] Kako: Então, Léo, estamos aqui com o Dev Meetups aberto, com o aplicativo aberto. Antes de mexermos nele aqui, brincar de background e foreground, vamos voltar no nosso código. Lembrando que está aberto, está foreground. Vamos voltar no nosso código. Aqui, no nosso código, lembrando, no "main.dart", nós temos muitas funções aqui, temos void setPushToken e tem outro void aqui, que é o void _startPushNotificationsHandler.

[01:19] Lembra? Dentro do _startPushNotificationsHandler, nós vamos descer e aqui, logo depois desse if(message.notification != null), esse if fecha o FirebaseMessaging.onMessage.listen.

[01:30] Tem esse ponto e vírgula do if, logo depois dele nós podemos fazer uma nova função. É uma função que vocês já sabem mais ou menos como mexe, FirebaseMessaging. - eu acho que eu escrevi massaging, não é massagem, é mensagem, messaging. Aqui nós vamos usar uma nova função, que você não estão acostumados, não é instance, é esse .onBackgroundMessage.

[01:58] Vamos aqui, FirebaseMessaging.onBackgroundMessage(). Aqui ele já tem como padrão um handler, que nós vamos criar, ainda não existe, ainda não temos. O que eu vou fazer? Vou fazer uma metodologia inversa do que fizemos da última vez. Da última vez eu criei o handler e eu usei ele. Agora eu vou usar ele e depois eu vou criar, só para você não ficar travado e sempre fazer as coisas do mesmo jeito.

[02:25] Eu vou vir aqui, vou criar um privado, vou chamar ele de (_firebaseMessagingBackgroundHandler);. Não existe ainda, então ele vai ficar em vermelho mesmo. Vamos criar ele aqui agora. Como fazemos para criar isso? Mais fácil ainda do que vir, copiar, colar, criar a função - não, você bem aqui, clica nele, aperta "Alt + Enter" e vai ter uma função create function e o nome da função.

[02:59] Você clica nessa opção e já estará tudo pronto, ele já vai criar a função para você no lugar certo que você quer. Agora nós vamos brincar com essa função, o que essa função vai fazer conosco.

[03:09] Leonardo Marinho: Kako, é importante ressaltar o seguinte, nós criamos, dentro daquele método, então lá está organizado tanto a captura do evento de foreground quanto o de background, pega o token, então nós centralizamos em uma função todos os gatilhos para receber a notificação, independente da forma que aplicativo esteja trabalhando, seja aberto, fechado ou background.

[03:29] Esse onBackgroundMessage é mais ou menos, por baixo dos panos, um listening também, igual o de cima, do foreground. Então, basicamente, ele vai ficar ali, preparado, ouvindo.

[03:42] Quando o aplicativo voltar para foreground, ele vai analisar e fala: tem um registro aqui de um push, que o sistema operacional do celular pegou e que rolou na hora que ele estava em segundo plano, então foi um background. E o evento de background que dispara, não o de foreground.

[03:58] Kako: Bacaníssimo, vou até escrever aqui, para sabermos exatamente o que é foreground e o que é background. Voltando lá embaixo, na função que acabamos de criar, ele é Future<void>.

[04:10] Se ela é future, eu já vou botar aqui que ela é o que? (RemoteMessage message) async. Já estamos cientes que temos que esperar, então vamos colocar ela como async. Aqui já estamos fazendo bastante coisa, então aqui já temos um handler, não precisamos de muita coisa. O que eu vou fazer?

[04:26] Eu vou fazer o que eu sempre faço, vou mandar um print(' ') para podermos saber se estamos recebendo as coisas certas, então ('Mensagem recebida em background: ${}'). Eu vou botar aqui os nossos valores da mensagem, vou botar entre chaves, porque é composto.

[04:41] Vou vir aqui e pegar ${message}, que estamos recebendo no nosso firebaseMessagingBackgroundHandler. Mas não só o message, eu vou querer ${message.data}. Relembrando, data são os dados, mas é isso.

[04:56] Leonardo Marinho: Sim. E outro detalhe, repare que o tipo da função é future, mas não estamos retornando um future. “Léo, Kako, então eu posso colocar como void o tipo?” Nesse caso não. Por quê? Porque aquela função, o firebaseMessagingBackgroundHandler espera receber como handler uma função que retorna o tipo future.

[05:18] Então, pela regra do jogo, nós temos que deixar assim. Foi até por isso que o Android Studio, ou o IntelliJ, o que você estiver usando, vai criar com o tipo Future<void>. Mas é só por isso, é uma especificidade da biblioteca em si, não necessariamente você é obrigado a criar coisas assíncronas, nós não criamos, só colocamos um print aqui.

[05:36] Kako: Prefeito. Vou dar um run aqui, só para testarmos, para darmos uma brincada, para darmos uma olhada, que tal? Run, rodou tudo certo. Rodou, temos o token, brincando aqui conosco. Vou abrir o emulador, temos o nosso Dev Meetups, está em foreground. Correto?

[05:53] Leonardo Marinho: Sim.

[05:54] Kako: Eu vou tirar ele do foreground. Vou tirar, sai, não estou mais nele.

[05:58] Leonardo Marinho: Background.

[05:59] Kako: Eu não vou nem abrir nada no emulador, não tem outro aplicativo nesse celular, mas vou deixar aqui, na tela inicial. Vamos brincar de mandar mensagem. Vou no Chrome e vou mandar uma mensagem. O que você prefere, que mandemos dados ou notificação?

[06:15] Leonardo Marinho: Preenche tudo.

[06:17] Kako: Tudo?

[06:17] Leonardo Marinho: Vamos ver o que acontece.

[06:18] Kako: Vamos lá, isso, aqui é o "Título do Dado", só para podermos ter um pouco mais de...

[06:29] Leonardo Marinho: Distinção do que é o que, na hora de receber os dados.

[06:30] Kako: Isso, "Mensagem do Dado". Aqui eu vou colocar "Título da Notificação" e aqui "Mensagem bonita: Léo é lindo". Pronto. Isso aqui se errarmos, não é? Vou mandar os dados e a notificação. Acho que deletou tudo, na verdade.

[06:52] Leonardo Marinho: Beleza. Não, não, eu acho que - veja lá se chegou.

[06:55] Kako: Vamos ver. Aqui.

[06:57] Leonardo Marinho: Ele vai ficar na dele, por enquanto.

[06:59] Kako: Certo. Na dele aqui, porque - vamos dar uma olhada no nosso código.

[07:05] Leonardo Marinho: Veja o Android Studio.

[07:05] Kako: Vamos ver o Android Studio primeiro. "Broadcast received for message".

[07:07] Leonardo Marinho: Então ele recebeu e não exibiu a notificação porque o aplicativo estava aberto, só que não está em primeiro plano, mas tudo bem, sem problema nenhum.

[07:15] Kako: Sim, aqui, no terminal, ele falou, ele recebeu dado, ele não recebeu a notificação.

[07:19] Leonardo Marinho: Agora como fazemos para receber aquilo que nós acabamos de codar? Nós temos que trazer o aplicativo para foreground.

[07:29] Leonardo Marinho: Vamos trazer ele para foreground e ver o que acontece.

[07:32] Kako: Vamos lá. No emulador, clico no aplicativo. Sabe o que eu acho? Como eu cliquei para enviar só os dados, ele enviou só a parte de dados.

[07:39] Leonardo Marinho: É possível.

[07:41] Kako: É bom possível.

[07:42] Leonardo Marinho: É possível.

[07:42] Kako: Vamos brincar aqui com a parte de notificações, porque nós já - já estamos em foreground, vou tirar de novo do foreground, deixar em background, como se nada estivesse aqui no emulador. Vou voltar no nosso Dev Meetups. Vou mandar a notificação: "Título da Notificação". Eu acho que ele não gosta que eu chame você de lindo, Léo, é isso.

[08:00] Leonardo Marinho: Chame de feio que funciona.

[08:02] Kako: "O Léo é feio", vamos ver. "Enviar". Está demorando para enviar.

[08:07] Leonardo Marinho: Às vezes ele demora um pouco, ele está carregando. Está carregando. Isso é importante, nem sempre funciona de primeira. A notificação, ela é um negócio assíncrono, então tem hora que ele vai, tem hora que vai dar uma agarrada, é normal.

[08:19] Kako: Eu acho que eu sei, é porque eu cliquei aqui e ele bugou.

[08:23] Leonardo Marinho: O macete do "Ctrl + C".

[08:25] Kako: "Ctrl + C".

[08:25] Leonardo Marinho: Ou "Command + C".

[08:25] Kako: Isso, se está travando muito o servidor de vocês, você volta no seu CMD e aperte "Ctrl + C" uma vez. Se apertar duas, vai fechar. Então aqui ele já recebeu: "Léo é feio".

[08:36] Era isso, ele só vai aceitar a verdade. Léo, desculpa. Vamos ver no nosso aplicativo. Tem duas notificações aqui. É por que eu cliquei duas vezes?

[08:47] Leonardo Marinho: Ele até reforçou.

[08:47] Kako: "Léo é feio", mas com força. Tadinho.

[08:50] Leonardo Marinho: Reforçado, duas vezes.

[08:51] Kako: Recebemos, estávamos em background. Perfeito.

[08:55] Leonardo Marinho: Agora, vem cá, no console do Android Studio, ele tem que logar, tem que dar no print.

[09:00] Kako: Tem que estar aqui, falando message.

[09:03] Leonardo Marinho: Volte o aplicativo para foreground, para vermos o que acontece.

[09:07] Kako: Foreground?

[09:08] Leonardo Marinho: O que ele vai fazer.

[09:08] Kako: Vou clicar aqui na notificação. E, pois é.

[09:12] Leonardo Marinho: Pode ser.

[09:13] Kako: Não apareceu aqui para nós.

[09:15] Leonardo Marinho: Beleza. Vamos ver o que pode ser.

[09:19] Kako: Vamos. Olha só, para resolvermos esse problema, a primeira coisa que vamos fazer é mudar esse ${message.data} para ${message.notification}.

[09:27] Porque antes nós estávamos recebendo os dados, data, não era uma notificação, então tínhamos muito mais dificuldade de receber esses dados. Mas, como estamos mexendo com notificação, vamos colocar a notificação para recebermos e vermos que está tudo sendo recebido conforme o esperado. Então mudamos o código, rodamos o nosso código.

[09:51] Leonardo Marinho: Muito importante, senão não vai dar diferença.

[09:52] Kako: Vamos ver se vai dar tudo certo. O token está aqui, certo, vamos confirmar, o nosso aplicativo está em background - ok, está em background, vou deixar o Chrome aberto no emulador. E vamos mandar uma notificação - uma notificação, focando aqui. Vamos escrever a notificação e clicar em "Enviar" na "Notificação", aqui, no nosso servidor padrão.

[10:13] Aqui, agora sim, que já armamos tudo, eu consigo falar a coisa mais correta possível, então "Notificação", agora eu posso falar que o Léo é lindo? Não, "o kako é lindo e humilde". Enviei. Bem rápido, já vamos olhar aqui, se no nosso Command Prompt já apareceu.

[10:41] Leonardo Marinho: Está ali.

[10:41] Kako: E humilde. Vamos ver o nosso Android Studio, está aqui, "Mensagem recebida em background".

[10:48] Ele nos manda uma instância de remote notification, então temos que dar uma tratada nessa informação que recebemos, ver o tipo de objeto que ela se transforma, depois transformar em texto, isso é brincadeira para nós já. Agora vamos ver no nosso aplicativo, olha aqui o aplicativo.

[11:07] Olha a notificação: “O kako é lindo e humilde”. Muito obrigado, vou até clicar nela, e voltou para foreground. Ufa.

[11:15] Leonardo Marinho: Bacana. Notificação, é um negócio que, como nós já falamos, não vai ser na hora que você quer, tem hora que vai fazer você passar vergonha, tem hora que vai funcionar. E é normal, porque é assíncrono, tem dispositivo que recebe na hora, tem dispositivo que atrasa um pouco.

[11:29] Mas é isso, siga o código, vá testando, tenha um pouco de persistência, que vai sempre funcionar bacana. Agora, Kako, uma coisa que é bem legal, que temos que mostrar para a galera, é a seguinte: nós estamos usando o servidor do Dev Meetups para disparar dados e mensagens. Mas, vem cá, como fazemos isso sem um código próprio?

[11:48] Kako: Pois é, e quem não sabe fazer um servidor dedicado?

[11:54] Leonardo Marinho: Pois é, ou às vezes não está no escopo do projeto. Tem como disparar isso na mão?

[11:58] Kako: Tem.

[11:58] Leonardo Marinho: Então vamos ver agora.

[12:01] Kako: Vamos brincar com isso na próxima aula.

[12:04] Leonardo Marinho: Isso aí.

[12:04] Kako: Valeu, galera.

[12:05] Leonardo Marinho: Valeu.

@@06
FCM Console

[00:00] Leonardo Marinho: Vamos dar uma olhada agora em como lançamos notificações de push na mão, sem ter um servidor web integrado, igual nós fizemos anteriormente? Até aqui nós usamos o Dev Meetups para poder mandar tanto dados, quanto notificações, quanto notificações com dados. Mas como nós saímos dele? Como fazemos isso na mão? Ou como você pode criar a sua aplicação e integrar? De onde que nós conseguimos gerenciar tudo isso?
[00:24] Basicamente tudo isso vem do Firebase Cloud Messaging, que fica dentro do Firebase Console. Então lá você consegue toda a chave de autenticação, integração, você consegue fazer a parte de push, você consegue mandar push, enfim, agora o Kako vai mostrar um pouco melhor isso.

[00:39] Kako: Porque, antes de começarmos, é muito importante que saibamos manejar um pouco essas coisas de servidores, de notificação e armazenar, porque às vezes nós não sabemos fazer um servidor que armazena as mensagens, as notificações. O Firebase já nos dá isso, olha que coisa maravilhosa. Então vamos lá. Primeiramente, o nosso Firebase Console, que vocês já estão cansados de brincar.

[01:03] Vou clicar no nosso "dev-meetups", no nosso projeto. No nosso projeto, nós vamos procurar o Cloud Messaging. Vamos descer a página um pouco, tem o Authentication, o Cloud Firestore, o Crashlytics, Cloud Messaging. Vou clicar nele e vamos entrar em um novo mundo: Cloud Messaging.

[01:21] Mandar a nossa primeira mensagem. Eu vou clicar no nosso botão, "Send your first message" e mandar a nossa primeira mensagem. Aqui tem muita coisa para nós vermos, para dar uma olhada, tranquilamente.

[01:33] Leonardo Marinho: Aqui nós conseguimos ver que uma notificação é muito mais completa e complexa do que conseguimos imaginar. Até então nós preenchemos basicamente quatro coisas: o título, uma mensagem, uma chave e valor dos dados, um título e mensagem nos dados. Quatro coisas. Mas aqui nós temos muito mais coisa. Começando pelo que nós já vimos, então tem o título da notificação e a mensagem da notificação.

[01:56] E ele já nos dá umas opções que são opcionais. Nós podemos, por exemplo, colocar o link de um PNG e essa imagem vai do lado da notificação, igual mostra ali no exemplo, no canto inferior direito.

[02:04] Nós conseguimos dar um nome também para essa notificação. Isso é interno, é só para o Firebase poder se organizar para depois você procurar essa notificação, enfim, quiser reaproveitar ela de alguma forma. Nós vamos deixar em branco. Conforme vamos rolando a página, ele nos dá steps, etapas, então você pode apertar "Next", próximo, por exemplo, e ele vai para a próxima etapa.

[02:26] A próxima etapa você segmenta para quem vai. Então, por exemplo, se você apertar em "Select an app", nós só temos um aplicativo, que é o Dev Meetups, que é para Android, mas, se você tivesse configurado um iOS, web, ele daria todas as outras opções. Então você segmenta para qual plataforma você quer, ou para qual tópico você quer mandar e ele manda.

[02:48] Ali nós temos registrados três devices, que provavelmente são emuladores que nós utilizamos para curso, para teste e tudo mais, então ele identifica três usuários que vão receber essas notificações.

[02:59] Mas, na realidade, vai ser um só, porque o emulador nós desinstalamos, reinstalamos, mas ele registrou como três. Pode dar o próximo. O "Scheduling", você pode agendar.

[03:10] Para quando você quer exatamente, dia, hora, você pode deixar isso agendado. Você pode fazer - eu não recomendo mandar de madrugada. Mas, se você quiser em um black friday, manda à meia-noite, uma hora da manhã, uma mensagem dessas, você não está afim de ficar na empresa à meia-noite para disparar isso, você agenda no horário comercial e à meia-noite o pessoal vai receber.

[03:28] Mas saiba muito bem o que você está mandando, porque agendar um negócio desse é tenso. Mas, por exemplo, vou pegar um horário mais simples, o horário de almoço, horário de lanche e tal. Você pode agendar, você não precisa se preocupar com isso. Deixamos em "Now" aqui, porque queremos que chegue agora. Avance.

[03:47] Conversão. Nós podemos cadastrar alguns eventos de conversão, então quando a pessoa toca para abrir o aplicativo via essa notificação, ou é a primeira vez que a pessoa abre o aplicativo e foi por causa da notificação ou purchase se a pessoa fez alguma compra na Google Play ou na Apple Store com base na abertura do aplicativo com esse push ou em algum link que esse push trouxe, enfim, aqui é a parte meio analytics da coisa.

[04:10] Kako: Imagina - desculpa, Léo - mas imagine o trabalho que deve dar você implementar isso no seu servidor, no nosso Dev Meetups, que é o nosso servidor local, fazer toda essa separação de o cara clicou no aplicativo e recebeu essa informação. Nossa, aqui já está tudo feito, maravilhoso isso.

[04:25] Leonardo Marinho: É maravilhoso. Podemos não preencher nada, isso nós podemos deixar em brando e vamos para o "Next".

[04:33] Kako: O label também, nós não temos label.

[04:36] Leonardo Marinho: Isso, você pode escolher um evento e dar uma label, dar uma descrição para depois fazer relatórios e olhar com calma. E aqui você pode botar campos opcionais.

[04:45] Esses campos opcionais é aquele "Dados", que tem no Dev Meetups API. Basicamente você pode colocar um canal, se você quiser colocar um ID de canal de transmissão, isso é uma coisa mais complexa, não vamos abordar no curso. Mas você também pode botar dados personalizados, que são chave e valor, que no Dev Meetups API web nós chamávamos de mensagem e dado. Não, acho que era título e mensagem, não é?

[05:07] Kako: Isso.

[05:08] Leonardo Marinho: Mas você pode colocar qualquer coisa. Então botar uma chave e valor, alguma coisa assim, vai aparecer no terminal, sem problema nenhum.

[05:16] Kako: Então é basicamente o nosso Dados, isso aqui.

[05:18] Leonardo Marinho: Isso, o Dados. O legal - quer ver, Kako, preencha alguma coisa aí, mesmo que seja chave e o outro, valor. Só para termos uma ideia. Conforme você vai preenchendo, ele te dá a opção de outros, você pode mandar vários desse. Ele manda um objeto com várias coisas. Isso é muito legal, você consegue passar várias instruções.

[05:34] O Kako, ele se empolga. Ali embaixo também tem o som, então você pode habilitar o som quando a notificação chega no celular da pessoa, se você quer que a notificação chegue quieta ou não. Deixe habilitado, só para ver se vai dar algum barulho, não sei se a gravação vai pegar. Você pode também dizer o tempo que expira o envio disso, o reenvio disso.

[05:55] Porque às vezes o celular da pessoa está desligado. Então, em quanto tempo a pessoa liga o aparelho dela, essa mensagem ainda chega? Porque às vezes é uma coisa para hoje, é uma promoção para hoje, então não faz sentido você deixar quatro semanas, porque daqui a quatro semanas a pessoa vai receber uma notificação, vai abrir e é mentira, igual faz de mina, passou, acabou.

[06:14] Kako: Olha a cobra.

[06:14] Leonardo Marinho: Passou, acabou. Exato, então não faz sentido. Ali você bota a data de expiração daquilo chegar, porque se a pessoa ligar o celular e passar o prazo, o celular não vai mostrar aquela notificação.

[06:24] Kako: Perfeito. Vou clicar em revisar.

[06:27] Leonardo Marinho: Isso, apertamos em revisar, você dá uma olhada. O dado, qual é o segmento, o scheduling dele, a hora que será enviado, é isso mesmo.

[06:39] Kako: É isso mesmo.

[06:39] Leonardo Marinho: Manda o "Publish".

[06:40] Kako: Publicar. Cliquei, está enviando.

[06:45] Leonardo Marinho: Então ele já nos dá uma estatística.

[06:49] Está dizendo que 0% abriu, porque nós ainda não abrimos a notificação, a hora, o envio foi completo para Android e tem a descrição básica dela. Clique em cima da notificação, Kako.

[06:59] Aqui ele vai dar um gráfico cheio de estatística se você tiver muitos usuários, de horários de pico, quem abriu mais, abriu menos e tal, é super legal. No emulador nós conseguimos abrir essa notificação e ver o que aconteceu.

[07:13] Kako: Vou clicar no emulador agora.

[07:16] Leonardo Marinho: Ele estava em foreground, então provavelmente.

[07:19] Kako: É verdade.

[07:19] Leonardo Marinho: Quer ver? Ele não vai aparecer.

[07:21] Kako: Não vai aparecer.

[07:22] Leonardo Marinho: Mas no Android Studio nós conseguimos pegar. Olha. Mensagem recebida.

[07:31] Kako: Aqui.

[07:31] Leonardo Marinho: É, então se quiser até minimizar ou fechar e mandar de novo, dá para reenviar, isso é muito bacana.

[07:35] Kako: Vamos ver então aqui? Bem rápido.

[07:37] Leonardo Marinho: Nós não precisamos preencher de novo.

[07:39] Kako: Mas foi nesse aqui que eu abri. Esse.

[07:41] Leonardo Marinho: Isso. Então o que você faz também? Ali, no canto direito, aparece um botão com três pontinhos, quer ver? Na direita. Você pode duplicar a notificação e como nós fazemos muitos testes, ou seja, provavelmente você vai fazer muitos testes também, esse botão de duplicar é divino.

[07:56] Kako: Divino.

[07:57] Leonardo Marinho: Pode mandar pro review e publicar, porque está tudo igual ao outro.

[08:03] Kako: Vamos ver como está o nosso aqui.

[08:03] Leonardo Marinho: Ele demora um pouco, tem que esperar um pouco para vim. Em background provavelmente não sei se vai chegar. Dê uma olhada também no Android Studio, se ele vai.

[08:12] Kako: No Android aqui? Às vezes a comunicação com o próprio Firebase dá uma demorada, tem uma analisada.

[08:20] Leonardo Marinho: Sim. Quer ver, Kako, vamos tentar mandar mais uma então? Fecha a aplicação completamente.

[08:25] Kako: Vou fechar a aplicação completamente.

[08:28] Leonardo Marinho: E nós duplicamos e mandamos de novo.

[08:31] Kako: Está bom.

[08:32] Leonardo Marinho: É legal também quando chegar vai tudo.

[08:34] Kako: De uma vez.

[08:36] Leonardo Marinho: Não, não, volta.

[08:37] Kako: Vou voltar.

[08:38] Leonardo Marinho: Tem um atalho ali.

[08:40] Kako: É verdade.

[08:41] Leonardo Marinho: Apertando os três pontinhos e duplicar.

[08:43] Kako: Três pontinhos e duplicar. Perdão, galera.

[08:47] Leonardo Marinho: Cheque só no - quer ver, desce. Vamos checar no "Scheduling". É "Scheduling"? Não, é "Target". Está setado certo.

[08:56] Kako: Estão setados os nossos aplicativos.

[08:58] Leonardo Marinho: Então vamos mandar bala.

[09:00] Kako: São esses três aqui, são os nossos mesmos.

[09:04] Leonardo Marinho: Isso.

[09:05] Kako: "Next", "Next", "Next", conversão. Não, tudo certo.

[09:07] Leonardo Marinho: Beleza, o review.

[09:08] Kako: Publicado. Mais uma vez. Agora vai, eu acredito.

[09:14] Leonardo Marinho: Agora vai.

[09:15] Kako: Agora não, mas desculpa, eu falo com o Firebase.

[09:19] Leonardo Marinho: Pedir estatística agora e resposta é engraçado. Às vezes ele demora um pouco, está vendo ali no status, ele já está avisando: deu uma agarrada para mandar.

[09:29] Kako: Isso. Talvez é porque nós mandamos muitas coisas ao mesmo tempo.

[09:32] Leonardo Marinho: É, às vezes ele entende como spam e dá uma segurada. Mas quer ver? Vamos no emulador ver.

[09:37] Kako: Emulador, fechado, não é?

[09:39] Leonardo Marinho: Não.

[09:41] Kako: É aqui.

[09:41] Leonardo Marinho: Não, nem precisa.

[09:41] Kako: É, mas como ele não.

[09:46] Leonardo Marinho: Mas galera, sem problema, vai funcionar no de vocês. Isso aqui é instabilidade de rede, demora porque mandamos muita notificação, às vezes ele dá uma segurada, porque pode ser spam, isso é super normal. Daqui a pouco vai começar a chegar e tudo bem.

[09:59] Kako: Só se lembre, o foco aqui é: você tem outro servidor com o qual você pode trabalhar e receber notificações, organizar elas e analisá-las, o que é maravilhoso.

[10:09] Leonardo Marinho: Então é isso, galera.

[10:11] Kako: É isso.

[10:11] Leonardo Marinho: Bom, nós esperamos que esse conhecimento tenha colaborado e ajudado bastante. Agora nós temos que nos aprofundar um pouco mais, agora começaremos a ver algumas coisas um pouco mais técnicas.

[10:24] Kako: Bacana, galera. Valeu.

[10:26] Leonardo Marinho: Valeu.

@@07
Comunicação Foreground

Sempre que pensamos em mandar notificações, pensamos em nos comunicar com nosso usuário. Logo, se o aplicativo estiver fechado (Background) e pensarmos em nos comunicarmos com o usuário, podemos mandar uma notificação e, de quebra, trazer nosso usuário de volta ao App.
Usando a mesma premissa, se o aplicativo está aberto (Foreground), não faz sentido mandarmos uma notificação que o levaria para fora do App, correto?

Como podemos nos comunicar por modo Foreground?

Basta mandar uma notificação normalmente, e ela vai chegar independente se o aplicativo está aberto ou não. Caso o usuário não queira receber mensagens enquanto está no app, ele pode bloquear as notificações.
 
Alternativa correta
Não podemos nos comunicar por modo Foreground, pois, os dados que são recebidos no servidor, e dele enviados para o dispositivo, podem apenas trafegar em segundo plano pelo código, nunca podendo ser usado para uma mensagem.
 
Alternativa correta
Podemos receber dados do nosso servidor e, com esses dados, podemos construir uma caixa de mensagem (SnackBar, Dialog, etc..) que aparece para o usuário com a notificação, dentro do próprio App.
 
Alternativa correta! Isso mesmo! Se o usuário estiver com o aplicativo aberto, não faz sentido mandar uma notificação fora do App, implementamos uma notificação dentro dele.

@@08
Faça como eu fiz

Chegou a hora de você seguir todos os passos realizados por mim durante esta aula. Caso já tenha feito, excelente. Se ainda não, é importante que você execute o que foi visto nos vídeos para poder continuar com a próxima aula.

Continue com os seus estudos, e se houver dúvidas, não hesite em recorrer ao nosso fórum!

@@09
O que aprendemos?

Nesta aula, você aprendeu sobre:
Importância das Permissões
Quando mandamos notificações ou fazemos alguma comunicação com o dispositivo por fora do nosso App, temos que pedir permissão para o usuário. É muito importante saber qual tipo de dispositivo o usuário possui para poder pedir a permissão da forma correta.
O que é Foreground
Quando nosso aplicativo está aberto no dispositivo do usuário, chamamos esse estado de Foreground (Primeiro Plano), e podemos ainda mandar mensagens e dados para o aplicativo, usando algum componente para criar alguma interação, como um cupom de desconto ou promoção.
O que é Background
Quando o aplicativo está aberto em segundo plano, chamamos este estado de Background (Segundo Plano). Conseguimos saber e enviar dados ou notificações para o usuário voltar ao nosso App. Há muitas opções disponíveis na Play Store, então queremos que o usuário lembre, sempre que possível, do nosso aplicativo.
Como funciona o FCM (Fire Cloud Messaging)
Vimos que é possível fazer toda mecânica de notificações apenas com o FCM, sem um servidor dedicado. Entendemos todos os elementos do Dashboard do Firebase Cloud Messaging para que possamos fazer diferentes notificações e análises de usuários.

#### 17/01/2024

@04-Aprofundamento

@@01
Projeto da aula anterior

Caso queira, você pode baixar aqui o projeto do curso no ponto em que paramos na aula anterior.

https://github.com/alura-cursos/flutter-notifications/tree/aula_3

@@02
Abrindo o app pela notificação

[00:00] Leonardo Marinho: Já capturamos uma série de formas diferentes de detectar a chegada de notificações. Tivemos foreground, background, terminated, nós vamos analisando a chegada só de dados, da notificação.
[00:13] Mas ainda tem uma que é muito importante, que nós não vimos, que é como detectar o evento de o aplicativo foi aberto através da notificação. Isso, pelo menos na minha opinião, não sei o Kako também, eu acho que ele concorda.

[00:27] Kako: Com certeza.

[00:27] Leonardo Marinho: É o evento mais importante de notificação para detectarmos. Por quê? É nele que você consegue saber dado publicitário, por exemplo: será que determinada campanha publicitária surtiu efeito? Será que um determinado cupom de desconto, uma determinada notificação em um horário específico converteu, engajou, a pessoa foi lá e abriu o aplicativo?

[00:50] Navegou no aplicativo, fez uma compra? De repente você consegue passar um token naquela notificação e aquela notificação, por algum motivo o usuário abre o aplicativo por ela e no final rastreia, descobre que ele fez uma compra, concluiu uma compra.

[01:02] Então você mapeou que aquela campanha publicitária é uma boa campanha financeiramente, gera vendas. Então é o evento mais importante de push notification na nossa opinião. Mas, Kako, como fazer isso em código?

[01:16] Kako: Então, não sei. Brincadeira. É só pra fazer vocês rirem um pouco. Muito de boa, mas muito de boa. Lembrando que você já tem spoiler do título do vídeo, do que vamos fazer, que é a abertura do aplicativo pela notificação. Nós vamos pegar esse dado. E como fazemos aqui?

[01:34] Vamos no nosso main e, no nosso main, lembra tudo o que temos aqui. Nós temos o startPushNotification, temos o setPushToken, as funções que nós criamos. Aqui, no nosso startPushNotification, temos o foreground e temos o background.

[01:52] Logo depois do background eu vou botar aqui um //Terminated, só para termos uma noção, porque o aplicativo está fechado, ou em background, mas não importa, está fechado. Então eu vou criar uma nova variável, vou chamar ela de var data =. Essa variável vai receber a nossa função, a nossa função tranquila.

[02:15] A nossa função que vocês já estão cansados de saber, = await FirebaseMessaging.instance, já dei um "Tab" aqui porque já estava carregado para nós. Instance o quê? .instance.getInitialMessage(). É igual à que nós tínhamos antes, Kako? Não, não é igual, nós tínhamos o listening, temos o onBackgroundMessage, não é exatamente a mesma coisa.

[02:37] Então o que esse var data vai fazer? Nós vamos receber esse data e ele vai nos falar se o aplicativo foi aberto pela notificação. Fácil assim.

[02:49] Leonardo Marinho: Sim. Mas atribui o valor a uma variável, mas e agora, o que eu faço com essa variável? Essa variável você consegue pegar dados que vem dessa notificação de push. Não vamos ver isso neste vídeo, vamos ver no próximo vídeo, mas é interessante o seguinte: foque, que é só essa linha para você gerar um evento que detecta se o aplicativo foi aberto ou não através da notificação.

[03:14] É até curioso, porque o que nós achamos o mais importante na realidade é uma linha tão pequena de escrever, perto de tanta coisa que nós já escrevemos, para criar listening, background messaging e tal. É isso, sem rodeio, sem complicação.

[03:27] Kako: Eu posso rodar, até botar a notificação, mas não estamos tratando esse data, não vamos ver, não vamos modificar ela neste vídeo ainda. Nós vamos fazer, com carinho, nas próximas aulas. Mas é importante que você lembre que existe muita coisa por dentro desse FirebaseMessaging.

[03:44] A coisa não é muito rápida. Você recebe os dados, mas recebe com vários métodos dentro dela. Então se forem fazer um teste com isso aqui, fiquem espertos, tem que fazer muitos testes, muitos mocks.

[03:59] Leonardo Marinho: Agora vamos tratar esse retorno e fazer alguma coisa com ele, porque senão ele será um código inútil, e nós não queremos código inútil aqui, com uma funcionalidade tão bacana dessas. Então no próximo vídeo vamos tratar isso.

[04:13] Kako: Valeu.

[04:14] Leonardo Marinho: Valeu.

@@03
Exibindo a mensagem

[00:00] Leonardo Marinho: Agora nós vamos estudar o que, na nossa opinião, é o evento mais importante que tem em push notification. Por quê? Porque, com esse evento, conseguimos mapear várias campanhas publicitárias, você consegue preparar várias coisas. Por exemplo, você consegue mandar um cupom de desconto para alguém, mas tem que ser só naquela hora, aquelas coisas, aquelas campanhas publicitárias geralmente de lojas eletrônicas fazem.
[00:22] Cupom de desconto de comida, às vezes no almoço, alguma coisa assim, então uma infinidade de coisas legais que dá para serem feitas. Qual evento é esse? Basicamente é o evento que nós conseguimos capturar quando o aplicativo é aberto através da chegada da notificação no celular.

[00:39] Talvez você se lembre, algum aplicativo de comida, alguma coisa assim, chega perto da hora do almoço, você não está com o aplicativo aberto, você está fazendo qualquer coisa, e chega uma notificação de cupom de desconto ou algum lembrete, alguma chamada para ação. Você vai, aperta naquela notificação e o aplicativo abre.

[00:55] O WhatsApp também tem muito disso, mensagem instantânea em geral, Telegram, alguns outros, chega uma notificação, você aperta e abre o aplicativo já no chat. Esse abrir aplicativo no chat, tem parâmetros sendo passados por baixo dos panos, que fazem o aplicativo entender que ele tem que jogar para aquela determinada tela.

[01:14] Então vamos aprender como fazer alguma coisa parecida, vamos passar parâmetros e fazer uma coisa bem legal. Kako, por onde nós começamos isso?

[01:24] Kako: Vamos criar uma tela. Vamos começar criando uma tela. Vocês já estão cansados saber como funciona uma tela muito simples, o dialog. Então vamos criar um tipo de dialog aqui e ele vai abrir sempre que receber que abriu o aplicativo pela notificação. Eu vou criar aqui void showMyDialog (){}.

[01:45] É uma função bacana. Ela vai receber, essa função vai receber uma string chamada (String message) {}, que vai ser a mensagem vinda da nossa notificação. Para deixar as coisas um pouco mais simples, eu já vou criar aqui o ok button, que é o botão que fica no showDialog, que nós clicamos e já saímos do dialog. Widget okButton = e eu vou usar aqui o = OutlinedButton.

[02:13] Leonardo Marinho: É importante, porque o outline e flat são depreciados, então tem que ser outlined.

[02:18] Kako: Isso. Eu vou botar aqui o onPressed:. Esse nós já estamos cansados de saber o que o onPressed: ()=>, quando apertamos ele aqui, o que eu quero fazer? Não é mais, é um igual, Kako. Eu quero sair, então => Navigator.pop(),. Fechou assim, bonito. Eu acho que estou deixando alguma coisa passar. Ele está pedindo um child:, que é uma criança.

[02:41] Temos que mandar um texto para o nosso botão, que é um child: Text('Ok!'),. Pronto. Fizemos o nosso widget aqui, deixa eu botar um ponto e vírgula no final dele para ele parar de chorar. Agora eu vou criar mais uma coisa, que são os nossos dados recebidos das nossas mensagens, no nosso showDialog.

[03:00] Eu vou vir aqui, AlertDialog alerta =, e o nome dele vai ser alerta. Ele vai ser um = AlertDialog() com alguns dados. O AlertDialog, ele já tem o título, title, então vou botar aqui um title: Text(),. Vou botar aqui ('Promoção imperdível'),. Lembrando que aqui você pode colocar uma - imperdível tem acento no I.

[03:31] Leonardo Marinho: Tem.

[03:31] Kako: Nós podemos colocar ele como dinâmico, esse título pode ser variável. Estamos botando ele estático aqui só para vocês entenderem o que estamos fazendo, mas fiquem à vontade. Vou colocar aqui o contexto, o content:, na verdade. Vou colocar que são as informações que vamos receber do nosso notification.

[03:48] Eu vou botar aqui que não é mais estático, é dinâmico, é o message que estamos recebendo lá em cima, que é o message que bem da nossa notificação, : Text(message),. Agora as ações no nosso AlertDialog, que é simplesmente o nosso ok button, actions: [ okButton],.

[04:01] Tranquilo. Fizemos o nosso AlertDialog, fizemos o nosso Widget okButton, agora precisamos fazer o nosso show dialog. showDialog(), ele precisa de um contexto e ele precisa de um builder. Eu vou pular essa parte do contexto aqui, por enquanto, mas vou direto para o builder aqui, o builder é tranquilo.

[04:21] Vamos criar aqui um showDialog(context: context, builder: (BuildContext context){}), vou chamar ele de context. Ele vai construir algo baseado no contexto. Aqui ele vai retornar alguma coisa para mim. O que eu quero que ele retorne? O return alerta, que nós criamos no nosso showDialog. E agora? E esse contexto?

[04:45] Leonardo Marinho: E agora? Qual é o problema aqui? Por que estamos empurrando o contexto para frente? Não estamos com o aplicativo aberto. Todos esses métodos estão sendo criados no main, antes da tela ser chamada. Nós só conseguimos ter o contexto quando a tela está aberta.

[05:01] Nós não conseguimos simplesmente pegar o contexto e sair passando para os widgets filhos, porque aqui nós não somos um widget filho ainda. Então qual é o macete? Nós conseguimos criar uma instância de um navigator do Flutter, que ele pega qual é o contexto aplicado na hora que a tela é renderizada, na hora que o aplicativo carregou todas as coisas.

[05:21] Em cima deste contexto nós conseguimos trabalhar. Então, basicamente, nós vamos criar uma global key, não é, Kako?

[05:28] Kako: Perfeito, exatamente. Eu vim aqui, para o topo do nosso código. Eu voltei no nosso main, estamos ainda no nosso "main.dart", mas antes do nosso void main eu vou criar essa key para nós. Aqui é final navigatorKey =, ela vai receber um = GlobalKey<>();. É um global key essa nossa key?

[05:51] Leonardo Marinho: Isso, é uma global key. Como todo o tipo de global key, nós precisamos especificar o tipo dela para o Flutter saber como gerar ela e qual o tipo que esperamos.

[05:59] Kako: Isso, é um estado de navegação.

[06:01] Leonardo Marinho: É um <NavigatorState>.

[06:01] Kako: Isso. Temos ela aqui, agora nós precisamos usar ela. No que nós usamos ela?

[06:05] Leonardo Marinho: Sim. Primeiro nós temos que dizer: material app, eu tenho uma chave global que vai monitorar várias coisas, dentre elas o contexto. Então nós temos que declarar para o material app esse navigator key.

[06:18] Kako: Perfeito. Então eu vim na nossa classe App, que já cria o MaterialApp e renderiza as telas. Bem aqui, depois do title - depois do title não, depois do home: EventsScreen(),, fica mais fácil.

[06:29] Leonardo Marinho: Pode ser depois do home, para organizar.

[06:30] Kako: Eu vou colocar aqui um navigatorKey:, que já é setado para isso, e vou botar o nosso : navigatorKey, que nós criamos. Agora não tem problema.

[06:39] Leonardo Marinho: Sim, e agora o material app se encarrega de se comunicar e passar o contexto para o que nós precisamos.

[06:43] Kako: Perfeito. Agora eu vou arrumar aqui o nosso showDialog. Por que, o que acontece? Se eu der um pop, ele vai sair para o nada, porque eu não tenho um contexto, então vamos arrumar isso. Eu vou botar onPressed: ()=> Navigator.pop(navigatorKey.currentContext!) e vou botar a nossa exclamação, porque ele pode ser nulo no começo.

[07:04] Depois ele recebe e ele funciona o nosso contexto. Então é a mesma coisa aqui embaixo, o nosso showDialog(context:, vai ser um context: navigatorKey.currentContext!, com a exclamação, por conta do null safety. Não tem nada chorando aqui. Mas eu sinto que estamos esquecendo alguma coisa.

[07:26] Leonardo Marinho: Sim, criamos todo o método de exibir um alerta, um diálogo, mas não chamamos ele em lugar nenhum.

[07:32] Kako: É isso, nós temos que chamar ele. Vamos lá, lá em cima?

[07:37] Leonardo Marinho: Isso, lá em cima, no data, onde estávamos pegando o evento de abertura do aplicativo via notificação. Nós temos que tratar esses dados e mostrar nas janelas de diálogo.

[07:48] Kako: Perfeito, agora vamos usar o data. Eu vou fazer aqui uma condição. Primeiramente eu vou dar uma olhada: data, primeiro eu quero saber se você não é nulo. Eu vou pegar o data, de dentro desse data, que estamos recebendo, e vou pegar dentro desse data a mensagem, if(data!.data['message']).

[08:09] Leonardo Marinho: É válido dizer que essa chave message é uma invenção nossa, nós vamos passar uma chave e um valor. Essa chave, nós optamos pelo nome message. Se você quiser batata, pode botar batata, sem problema.

[08:19] Kako: Aqui então ['message'].lenght > 0){}. Perfeito. Exatamente. Aqui eu só vou finalizar essa condição, vou colocar aqui o nosso showMyDialog(), que é o que acabamos de criar, e vamos ter (data.data['message']).

[08:34] Leonardo Marinho: Perfeitamente.

[08:37] Kako: Então aqui, como o Léo estava falando, se eu quiser eu posso mudar o nome do message para batata. A única coisa que vai mudar é que quando formos fazer lá, vou ter que mandar batata e não mandar mensagem.

[08:49] Leonardo Marinho: Exato, quando for disparar a notificação, você tem que colocar a chave batata.

[08:52] Kako: Isso. Só para vocês não ficarem muito confusos aqui, se você quiser nós podemos mudar esse data para, sei lá, "Shift + F6", eu vou colocar aqui notification.

[09:05] Então não precisa ficar muito confuso com esse data de data não. Esse data foi uma variável que nós criamos e ele está recebendo o data, que é recebido pela nossa notificação. Vou deixar notification só para vocês entenderem um pouco melhor.

[09:22] Leonardo Marinho: Agora então temos que rodar esse código e testar, ver o que acontece.

[09:26] Kako: Perfeito. Vou dar um stop primeiro e rodar de novo, só para não ter nenhum problema de hot reload, que às vezes ele pode ter algum problema aqui, que estamos mudando o nosso "main.dart", a nossa font function, então é uma boa prática fazermos isso. Esperamos um pouco. Enquanto esperamos aqui um pouco, vamos no nosso Firebase Cloud Messaging, vamos criar uma nova notificação?

[09:51] Leonardo Marinho: Bora.

[09:52] Kako: Bora. Então vamos aqui, Título "Mega Promoção"?

[09:57] Leonardo Marinho: Isso, o Dev Meetups está dando 50% de desconto, mas só agora, se você abrir a notificação e pegar o cupom de desconto para poder usar.

[10:06] Kako: "Dev-MeetUPS está dando 50% de desconto! Mas só agora ein.".

[10:12] Leonardo Marinho: Então nós conseguimos fazer uma simulação. Mas nós conseguimos fazer uma simulação de uma campanha publicitária, daquelas urgentes.

[10:21] Kako: Isso.

[10:21] Leonardo Marinho: Do tipo: “Meia-noite, black friday, se você não pegar esse cupom agora, você perdeu, é agora”. É isso.

[10:25] Kako: Exatamente.

[10:25] Leonardo Marinho: E o target seleciona o aplicativo.

[10:27] Kako: Isso, é a mesma coisa que nós fizemos na última, no scheduling nós queremos mandar agora. Conversão de evento, eu não quero nenhuma conversão. Aqui no "additional options" já é especial.

[10:37] Leonardo Marinho: Aqui já é especial. Está vendo no "Custom data", que são os dados personalizados? Neste key nós temos que colocar "message", porque é isso que vai bater no código com aquela chave que estamos testando. Se você quiser mudar de message para outro nome, sinta-se livre, mas você tem que especificar aqui aquele nome, e no código tem que ser exatamente igual.

[10:54] Kako: Então só para ver se eu entendi: se eu tivesse botado batata aquela hora no código, era aqui que eu ia ter que mudar.

[11:00] Leonardo Marinho: Exatamente.

[11:00] Kako: Entendi.

[11:02] Leonardo Marinho: Exatamente, essa é a chave. Nós podemos passar várias chaves e valores, nós estamos passando um só, mas, por exemplo, se eu quisesse passar um título personalizado, em message você poderia botar um title e especificar também, e no código, o título da notificação, você receberia esse parâmetro. Como aqui nós só queremos mostrar como é e tal, nós só colocamos uma mensagem.

[11:17] Kako: Então aqui, essa mensagem, esse valor é a mensagem que nós vamos passar no nosso show dialog.

[11:22] Leonardo Marinho: Isso. É o que vai aparecer para o usuário na hora que abrir o aplicativo.

[11:27] Kako: "Você acaba de receber um cupom de desconto:". Eu vou botar aqui o cupom de desconto como "BATATA50%". Criativo aqui.

[11:34] Leonardo Marinho: Beleza. Antes de disparar, só checar uma última vez se a aplicação está fechada no emulador.

[11:39] Kako: É verdade. Estava aberta.

[11:40] Leonardo Marinho: Estava aberta.

[11:41] Kako: Já ia dar problema.

[11:41] Leonardo Marinho: Tem que estar fechada, senão não vamos detectar o evento.

[11:44] Kako: Fechei. Vou deixar fora, vou até confirmar se fechou. Fechou.

[11:49] Leonardo Marinho: Fechou.

[11:49] Kako: O nosso Android Studio parou de rodar. Vou dar um "Review" na notificação, ver se está tudo certo, desconto. Publicarei. Agora.

[11:59] Leonardo Marinho: Tem também um macete, se der erro, copie o código do evento para o foreground, para o listening e deixe o aplicativo aberto, vai te disparando para você ir debugando, porque debugar assim é no escuro. O nosso código, nós sabemos que ele funciona, então beleza, estamos fazendo no escuro agora. Mas fica a dica também se você quiser debugar.

[12:15] Kako: Então aqui o emulador.

[12:16] Leonardo Marinho: Beleza, chegou a notificação.

[12:17] Kako: Chegou a notificação. Vou cruzar os dedos, ai meu Deus. Cliquei na notificação. E agora? Rufem os tambores. Não foi. Vamos ver o que aconteceu aqui. Olha só, não está rodando, então é difícil. Existe uma coisa que eu quero que vocês prestem bastante atenção, que é muito fácil você ter erro de digitação, que foi o caso hoje.

[12:42] Leonardo Marinho: Esse erro entra naquela categoria dos mesmos erros de não botei ponto e vírgula e não sei onde deu o problema. É esse.

[12:49] Kako: É, um erro que dá uma dor de cabeça. Olha só, vou mostrar para vocês, parece tudo normal, tudo tranquilo. notification!.data['message'].lenght. Se dermos uma olhada no nosso log, se rodarmos o nosso aplicativo, vocês vão ver que ele vai dar uma brincadeira com um tal de length. Ele vai falar para você que você escreveu length errado. No caso, eu, Kako, escrevi length errado, não é lenght com H antes do T, é length com H depois do T. Então vou rerodar aqui. Isso acontece, galera.

[13:15] Leonardo Marinho: Acontece.

[13:22] Kako: Mais importante do que você ficar com o olho muito esperto para qualquer erro de digitação, é você saber olhar o seu console de erros. O que ele está te dizendo? E você consegue arrumar o seu problema. Rodei aqui de novo, está aberta a nossa aplicação. Vou fechar a nossa aplicação e vou mandar de novo a nossa mensagem. Para facilitar.

[13:49] Leonardo Marinho: Duplicar, não preciso reescrever ela.

[13:51] Kako: Perfeito, mega promoção, Dev Meetups, só confirmar se lá embaixo o nosso message está message mesmo. E os nossos dados. Dar um "Review" e um "Publish". Agora vai.

[14:06] Leonardo Marinho: Vamos ver.

[14:07] Kako: Recebi ali.

[14:09] Leonardo Marinho: Chegou a notificação.

[14:09] Kako: Eu cliquei. Aí, garoto. O meu fone até caiu.

[14:19] Leonardo Marinho: Então é isso, conseguimos receber um dado, a mensagem, que está composta, é completamente vinda da notificação, nós não temos esse texto dentro do código do aplicativo, então a mensagem está genérica. Claro que o título está promoção imperdível, então te recomendo brincar com o código, personalizar, a notificação não pode ficar 100% genérica. E dá para brincar à vontade em cima das notificações que foi esse evento.

[14:45] Leonardo Marinho: Então é isso.

[14:45] Kako: Beleza, galera. Muito obrigado.

[14:47] Leonardo Marinho: Agora temos que dar uma olhada em uma coisa mega legal, que o Flutter 2 nos trouxe, que é push em web. Como fazemos um push chegar em uma aplicação web feita em Flutter? Vamos ver isso.

[14:59] Kako: Bora.

@@04
Push notification web

[00:00] Leonardo Marinho: Agora vamos aprender como integrar a parte do Firebase Cloud Messaging com a parte web do Flutter. Se você não está por dentro, não está antenado nisso, depois do Flutter 2, a partir da atualização do Flutter 2, o Flutter dá suporte à aplicação web. Então você vai lá, codifica em dart e ele gera em web, HTML, CSS, JavaScript, por baixo dos panos. Então como conseguimos fazer isso, Kako?
[00:23] Kako: Para fazermos isso, é muito simples. Primeiramente temos que criar uma pasta web. O que acontece? No nosso projeto nós já temos a pasta Android e temos a pasta iOS, que é o que permite que o Flutter seja híbrido, ajude tanto o Android quanto a Apple. Nós temos que criar uma versão para web, temos que criar uma pasta web. Como fazemos isso?

[00:46] Nós vamos no terminal aqui - se você não tiver terminal no seu próprio code system, no seu Android Studio e etc., o VS Code, você pode abrir o seu CMD. Só se lembre que você tem que estar na pasta do seu projeto. Você vai escrever create.

[01:12] Leonardo Marinho: Flutter.

[01:12] Kako: Não, flutter, obrigado. flutter create ., eu digo ponto, porque você tem que escrever o ponto, não é o ponto que acabou. flutter create ., vou dar um "Enter" e ele vai começar a criar o nosso projeto web. Uma coisa importante que vocês saibam é que o nome do seu projeto, ele tem que estar sem traço.

[01:31] Se tiver traço no seu projeto, se fosse, por exemplo, "flutter-notifications-start", ele iria dar problema, falando que o nome não é compatível. É importante que você mude o nome da sua pasta, se tiver traço, para underline.

[01:45] Leonardo Marinho: Perfeito. Ele vai criar ali a pasta web com tudo que nós precisamos para rodar a aplicação web de fato.

[01:51] Kako: Então nós temos agora a nossa pasta web. E agora, o que fazemos?

[01:57] Leonardo Marinho: Ali nós temos alguns arquivos. Dentre eles, temos o "index.html", que basicamente será a base de como vamos operar. Dentro do "index.html" nós vamos invocar um novo arquivo, que vai se comunicar com o Firebase Cloud Messaging.

[02:14] Então, primeiro, eu acho que temos que ir na documentação, dar um passo atrás. Vamos voltar para a documentação do plugin do Flutter com o Firebase Cloud Messaging. Lá nós vamos descobrir mais pistas do que temos que fazer agora na parte web.

[02:29] Kako: Perfeito. Exatamente, nós não sabemos o que temos que fazer? Documentação.

[02:34] Leonardo Marinho: Sempre.

[02:36] Kako: De novo, estamos aqui no nosso "firebase.flutter.dev", vamos no "Cloud Messaging" - vocês já estão cansados de saber disso. Agora clicamos em "Usage" e vamos pesquisar até lá embaixo, vamos rodar até lá embaixo, até achar "Handling messages". Nós temos o "Web tokens", tudo bonito. Vou descer um pouco mais, bem aqui, nesse azul.

[02:58] Nós já temos uma ajuda muito boa. Aqui ele fala que já temos a demonstração completa web. Se você clicar aqui, ele vai te mandar para um GitHub com as coisas já quase todas prontas. Entramos no GitHub do nosso "flutterfire" do nosso Firebase. Eu vou clicar na pasta "web".

[03:16] Leonardo Marinho: Exato. Ali temos os dois arquivos que precisamos.

[03:19] Kako: Exatamente. O "index", que já existe, e esse "firebasemessaging", que não existe ainda.

[03:25] Leonardo Marinho: E fica aquela pergunta: Léo, Kako, mas o meu projeto já tem um "index.html", o que eu tenho que fazer diferente? Abre o "index.html", Kako, por favor.

[03:33] Kako: Abrindo aqui.

[03:34] Leonardo Marinho: Consegue dar um pouco de zoom na tela?

[03:36] Kako: Agora.

[03:37] Leonardo Marinho: Então, olha só. Esse já importa aquele "gstatic.com/firebase.js", ele já tem o "firebaseconfig", ele tem ali embaixo o "firebase.initializeApp", então ele já está preparado com uma série de coisas para trabalhar com o Firebase com o Cloud Messaging. O nosso, por padrão, quando o Flutter cria, não vem com isso.

[03:55] Kako: Exato.

[03:55] Leonardo Marinho: Então o que vamos fazer? Pode selecionar esse arquivo todo, copie e cole, substituindo tudo que está dentro do seu "index.html" na pasta "web" do seu projeto.

[04:04] Kako: Então vou vir aqui, já vou selecionar tudo, "Ctrl + C". Volto no nosso "index.html", dou um "Ctrl + A" para selecionar tudo e um "Ctrl +V" para printar tudo, bem bonito, tudo aqui.

[04:22] Leonardo Marinho: Perfeito. Agora precisamos também criar o arquivo de configuração do service worker, que vai trabalhar em cima, com o Firebase Cloud Messaging. Vamos voltar no GitHub e pegar a cola da galera.

[04:37] Kako: Exatamente. Antes de voltar lá, já vou criar aqui o nosso arquivo.

[04:42] Leonardo Marinho: Perfeito.

[04:42] Kako: É um arquivo dart? Não é um arquivo total.

[04:44] Leonardo Marinho: É um arquivo JavaScript.

[04:46] Kako: Então vai ser um arquivo cru. Vamos pegar o nome dele? Realmente, nós temos que voltar no GitHub para pegar o nome dele, você tinha toda a razão. Vou voltar no nosso GitHub e esse é o nome dele. O nome dele, já vou vir aqui e copiar o nome dele, "firebase-messaging-sw.js".

[05:04] Vamos lá.

[05:05] Leonardo Marinho: Para vocês, que forem antenados com web, com font, essas coisas, o SW é de service worker. É um serviço que vai ficar rodando em segundo plano no navegador, monitorando se vamos ter notificações ou não futuramente chegando.

[05:19] Kako: Perfeito. Então vou voltar aqui - espera que eu estou com dificuldade de achar o GitHub. É muita coisa.

[05:23] Leonardo Marinho: É muita aba.

[05:24] Kako: É muita aba.

[05:26] Leonardo Marinho: Então abra esse arquivo, copie e só vai.

[05:28] Kako: Copiar tudo aqui. Volto para o Android Studio, "Ctrl + V", temos tudo, bonito. Configuramos com precisão, como precisávamos hoje.

[05:39] Leonardo Marinho: Isso. De configuração aqui, por enquanto, ok. O próximo passo é que, se você reparar, dentro desse monte de "firebaseconfig", tem API key, domínio, tem coisas de react native.

[05:51] Não é isso o que vamos fazer. Nós só estamos copiando e colando chave de autenticação de outra pessoa, que não fazemos nem ideia se essa chave funciona, enfim, não é nossa, não é para usar. Então o que temos que fazer agora? Temos que ir no Firebase e configurar as nossas. É isso o que vamos ver no próximo vídeo.

[06:06] Kako: Perfeito. Então até lá, galera. Valeu.

[06:08] Leonardo Marinho: Valeu.

@@05
Configuração no Firebase Console

[00:00] Leonardo Marinho: Agora nós precisamos terminar de configurar a parte de navegação web, afinal criamos os arquivos, o "index", o arquivo do service worker do JavaScript, mas as chaves de autenticação estão todas zoadas. Então agora nós precisamos gerar a nossa chave de autenticação corretamente no Firebase Console. Dentro do Firebase Cloud Messaging, para podermos, de fato, autenticar a aplicação web e conseguir enviar estas notificações.
[00:23] Nós também vamos ensinar alguns macetes de como rodar o Flutter web de uma forma que conseguimos receber as notificações, porque se você for no Android Studio, ou no Visual Studio Code, ou no IntelliJ, onde quer que você for rodar, se você usar Flutter run por debaixo dos panos ou apertar aquele botão de play verde, ele vai abrir uma instância que é uma cópia do Chrome, mas não é o Chrome de verdade.

[00:44] Nós não conseguimos capturar o push ali, então vamos mostrar também como criamos um web driver para poder executar de fato, um web server para poder executar de fato, no Chrome de verdade e capturar essas notificações. Então, Kako, vamos lá, nós temos que ir no Firebase Console e começar a criar a autenticação.

[01:01] Kako: Bora. Estamos aqui no nosso projeto do "dev-meetups". Nós já temos o aplicativo aqui, que é o nosso aplicativo Android. O nosso - deixa eu arrastar para cá, para vocês verem, está aqui. Mas não queremos usar esse, nós queremos usar na web agora. Então "Add app", vem em "Web" e agora vamos criar a nossa aplicação. Vou botar um nome bonito aqui. É o "Dev Meetups Web". Seta essa opção? Não, não é?

[01:37] Leonardo Marinho: Não.

[01:38] Kako: Tranquilo, registrar o nosso app. Aqui nós não precisamos hostear a nossa página ainda.

[01:46] Leonardo Marinho: Eles são espertos, oferecem serviço de hosting.

[01:50] Kako: É completo.

[01:52] Leonardo Marinho: Ele dá uma parada bem bacana. Aperta em "Use a

@@06
Mobile ou Web?

Quando aprendemos a mandar notificações, focamos inicialmente em mandá-las apenas para dispositivos celulares. Mas, agora que o Flutter tem suporte para aplicações Web, podemos fazer a mesma coisa em Websites!
Vamos praticar? Primeiramente, observe os dois trechos de código abaixo:

(Código 1)

var firebaseConfig = {
    apiKey: "AIzaSyA-wgG4d4y6p1wbSZGQvoVqf-AbwPSaulg",
    authDomain: "dev-meetups-99687.firebaseapp.com",
    projectId: "dev-meetups-99687",
    storageBucket: "dev-meetups-99687.appspot.com",
    messagingSenderId: "909873873474",
    appId: "1:909873873474:web:071cfb0256000be5f923db",
    measurementId: "G-D2NVS5ND3N"
    };
COPIAR CÓDIGO
(Código 2)

NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );COPIAR CÓDIGO
A partir do que você observou nos códigos, indique qual deles é Mobile e qual é Web:

Os dois códigos são necessários para rodar tanto na Web quanto no Mobile. Ou seja, sem um deles, nenhuma notificação funcionaria.
 
Na verdade, cada um dos códigos possui uma função específica para o Web ou Mobile.
Alternativa correta
O Código 1 é para Web, porque tem uma função que entrega todas as configurações básicas para a Web. O Código 2 é para Mobile, porque a função é voltada para configuração da notificação em um dispositivo móvel, com alertas, sons etc.
 
Alternativa correta! Muito bem! O primeiro código é a configuração do Firebase para uma aplicação Web, enquanto, no segundo código, podemos alterar como vamos receber as notificações nos celulares!
Alternativa correta
O Código 1 é para Mobile, porque tem uma função que entrega todas as configurações básicas para a Mobile. O Código 2 é Web, porque a função é voltada para configuração da notificação em um website, com alertas, sons etc.

@@07
Faça como eu fiz

Chegou a hora de você seguir todos os passos realizados por mim durante esta aula. Caso já tenha feito, excelente. Se ainda não, é importante que você execute o que foi visto nos vídeos para poder continuar com os próximos cursos que tenham este como pré-requisito.

Continue com os seus estudos, e se houver dúvidas, não hesite em recorrer ao nosso fórum!

@@08
Projeto final do curso

Caso queira, você pode baixar aqui o projeto completo implementado neste curso.

https://github.com/alura-cursos/flutter-notifications/tree/aula_4

@@09
O que aprendemos?

Nesta aula, você aprendeu a:
Abrir o App pela notificação
Aprendemos que podemos receber um parâmetro que indica quando o usuário abre o aplicativo pela notificação, e com essa informação temos infinitas possibilidades.
Personalizar o app conforme a notificação
Vimos como usar um Widget que já dominamos (showDialog) para mostrar uma mensagem baseada na notificação que foi recebida e aberta pelo usuário, criando uma integração única entre o usuário e o aplicativo.
Usar notificações na versão Web
Com o suporte ao Flutter para a versão Web, podemos criar nossas aplicações na versão Web e usar notificações para usuários que estão acessando o website. Com essa ferramenta, podemos distinguir quais usuários estão no dispositivo móvel e quais estão na versão Website e, a partir disso, criar interações únicas para cada um.

@@10
Conclusão

[00:00] Leonardo Marinho: Que maneiro, finalmente chegamos então ao final de mais um curso aqui da Alura. Olha só, nós aprendemos muita coisa legal, nós vimos muita coisa sobre notificações, o aplicativo, na aula 1, começou puro, simples, zero coisas de notificações, e hoje nós temos um aplicativo integrado com muita coisa que push mega personalizado.
[00:23] Então vamos dar uma olhada, Kako, no código e em o que nós vimos, revisar tudo e como nós aprendemos coisa aqui.

[00:30] Kako: Vamos, vamos revisar aqui. Nossa, é coisa para caramba o que nós fizemos. Passou rápido até, também, conosco falando, não tem como, passa muito rápido. Aqui, no nosso main, nós mexemos em pouquíssimos arquivos. No nosso "main.dart" nós fizemos o quê? Nós fizemos uma global key para usar depois no nosso material app. Aqui, dentro do main, um bocado de coisas, Léo, fale para nós, nós temos muita coisa aqui.

[00:55] Leonardo Marinho: Então, nós primeiro inicializamos a instância do Firebase, então nós configuramos, colocamos o Firebase Core na aplicação, colocamos o Firebase Messaging como dependência no "pubspec.yaml". Aqui nós inicializamos o Firebase.

[01:06] Pegamos a instância do Firebase, configuramos as permissões de acesso de notificação, se o usuário queria ou não autorizar a ter notificação. Testamos se o usuário autorizou, autorizou provisoriamente ou não autorizou. Em cima disso tomamos várias ações.

[01:21] Kako: Exatamente. Depois disso nós criamos mais uma função, que foi a startPushNotificationHandler, que ela trabalha com o token que recebemos. Aqui dentro ainda colocamos mais um token, só para o web.

[01:36] Colocamos um print só para termos certeza de que o token estava aqui. Trabalhamos com o modo foreground, que é o aplicativo aberto e as mensagens que ele recebe com o aplicativo aberto. Lembrando que nós recebemos data e recebemos notifications, que são dados e notificações, de uma forma diferente.

[01:52] Depois trabalhamos com background, que é caso o aplicativo não esteja ali aberto e tal. Ele está ligado, mas não está aberto. Depois trabalhamos com ele terminated, que é quando não está nem aberto de jeito maneira, está fechado, a pessoa recebe a notificação. Entrou aqui e recebeu um dialog para a pessoa ver a mensagem de promoção.

[02:13] Leonardo Marinho: E nós pegamos, pusemos o token, que é o token de autenticação, para realmente conseguirmos trabalhar. Poxa, como nós economizamos o servidor, economizamos transação de dados? Então criamos um mecanismo com shared preferences para podermos salvar localmente o token que nós já enviamos, testar todas as vezes que aquele token já foi enviado ou não foi enviado para o servidor.

[02:35] E, caso não fosse, não tinha sido enviado, nós enviamos e ele registrava que ele foi enviado. Fizemos todo esse mecanismo. Pegamos os dados do dispositivo, então sabemos se é um Android, se é um iOS, qual é o modelo para poder salvar no servidor. Trabalhamos em cima da model de device, organizamos tudo de uma maneira padrão.

[02:55] Kako: Perfeito.

[02:55] Leonardo Marinho: Ficou mega redondinho.

[02:59] Kako: Depois nós só viemos aqui e colocamos mais um - usamos aquele global key que eu falei em cima, no nosso material app para poder dizer mais uma vez que não podemos abrir o aplicativo do nada e dizer que já tem um contexto. Então nós meio que já inicializamos o contexto aqui já.

[03:16] Leonardo Marinho: É, e ali temos o acesso global de contexto, para poder exibir mensagens e tudo mais.

[03:21] Kako: Sim. Para finalizar um pouco aqui, nós fizemos uma mensagem para o background handler, só para podermos manejar esses dados que vem quando o aplicativo está em background.

[03:32] Leonardo Marinho: E, por último, mas não menos importante, aqui no arquivo main temos o showMyDialog, que é a caixa genérica de alerta, que nós colocamos para ser disparada quando a pessoa abrir o aplicativo tocando na notificação que chegou quando o aplicativo estava fechado.

[03:46] Aqui nós simulamos uma ação publicitária, com cupom de desconto. Mas sinta-se livre para personalizar da maneira que você achar melhor. E não para por aí, nós fizemos algumas alterações no arquivo web também?

[03:59] Kako: Exato, nós tivemos que mudar aqui a nossa URL, principalmente.

[04:05] Leonardo Marinho: Importante.

[04:05] Kako: Importante, mas mais importante é aprendermos como nos comunicávamos, qual era o formato de comunicação do post deste servidor, precisava de um token, de um modelo, de uma marca, tudo isso.

[04:20] Leonardo Marinho: Aqui nós fazemos a ponta, terminamos aquela parte do shared preferences, do token, usamos um controlador booleano, se o token já foi enviado ou não, tratamos a exceção, então se o servidor não retornou 200, deu uma falha, mostramos uma exceção. Se não, beleza, o token foi enviado, nós trocamos para true no shared preferences.

[04:38] Kako: Exato.

[04:39] Leonardo Marinho: E também teve uma coisa super legal, não é, Kako? Que é a parte web do Flutter, que é uma coisa atualmente bem recente até pelo período que estamos gravando o curso. Nós conseguimos receber notificações em browser, é muito maneiro.

[04:52] Kako: É muita coisa, cara, vocês aprenderam muita coisa neste curso. Já quero falar que tirem da cabeça que isso aqui é Flutter iniciante, já passou do intermediário e vocês já estão no nível avançado. Para vocês conseguirem fazer isso aqui e entender o que nós estávamos fazendo, conseguirem aplicar para os projetos de vocês, parabéns, vocês estão em Flutter avançado.

[05:13] Leonardo Marinho: É verdade. E push é um recurso mega utilizado em vários aplicativos: comida, curso, música, transporte, tudo o que você pode imaginar, usa, e agora você está munido, para a sua carreira, de um recurso super bacana e para poder personalizar da maneira que você achar legal. E não aprendemos só isso, tem toda a parte do Firebase Console, a parte de configurar o servidor para rodar, o nosso servidor Dev Meetups API local.

[05:37] Então você aprendeu a rodar servidor do local, a se comunicar localmente, aprendeu a configurar tudo no Firebase do zero, então cria uma aplicação, configura a aplicação do Android, web, pega token, joga "google-service.json" na pasta Android, pega a autenticação do console para jogar na aplicação da API.

[05:57] Mind explode, explodiu a nossa mente. Aprendemos muita coisa bacana aqui e foi um prazer enorme você ao longo desse aprendizado.

[06:05] Kako: Foi um prazer acompanhar todos vocês nessa jornada maravilhosa que tivemos neste curso. Obrigado.

[06:12] Leonardo Marinho: Então é isso, parabéns por mais essa conquista.

[06:14] Kako: Não esqueça: quando for dar a sua avaliação, curtir, se inscrever no canal, escreva um pouco, um texto do que você gostou, do que você não gostou, para podermos melhorar no próximo curso.

[06:25] Leonardo Marinho: Com certeza.

[06:27] Kako: Valeu.

[06:28] Leonardo Marinho: Tchau. Então valeu, é isso.