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
PRÓXIMA ATIVIDADE

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
PRÓXIMA ATIVIDADE

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
PRÓXIMA ATIVIDADE

Chegou a hora de você seguir todos os passos realizados por mim durante esta aula. Caso já tenha feito, excelente. Se ainda não, é importante que você execute o que foi visto nos vídeos para poder continuar com a próxima aula.

Continue com os seus estudos, e se houver dúvidas, não hesite em recorrer ao nosso fórum!

@@08
O que aprendemos?
PRÓXIMA ATIVIDADE

Nesta aula, você aprendeu sobre:
Enviar dados para o Servidor
Revimos como fazer uma comunicação HTTP com o servidor e usar a função .POST para enviar dados, do dispositivo para o servidor, com o protocolo correto.
Descobrir informações sobre o dispositivo do usuário
Usamos um novo pacote (device_info_plus) para descobrir informações sobre o dispositivo do usuário e podermos ter um banco de dados mais detalhado sobre cada um dos nossos usuários.
Importância do Token
Aprendemos que o token único para cada usuário é imprescindível, e que é importante que o dispositivo do usuário salve esse token para que ele não mude sem necessidade, pois isso confundiria nossa análise de dados.
Comunicação entre servidor e FCM
Descobrimos como é fácil integrar o FCM com um servidor dedicado e isso nos permite enviar notificações e dados para os dispositivos cadastrados no servidor.