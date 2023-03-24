# marvel_challenge

O projeto consiste em fazer um aplicativo para listar super heróis utilizando uma API da marvel, https://developer.marvel.com/ e deve conter as seguintes funcionalidades:

- Listagem dos super-heróis limitados à 4 itens por página
- Deve ser possível filtrar os personagens por nome
- Paginação conforme número de super heróis

Plus:
- Criação de uma tela de detalhes do super herói

Projeto desenvolvido utilizando os padrões de clean arquitetura, SOLID e TDD.

# No aplicativo, utilizei as seguintes libs:

- crypto: Utilizei para gerar uma hash MD5
- provider: Utilizei para gerenciamento de estado
- http: Utilizei para conexão com serviço
- cached_network_image: Utilizei para guardar as imagens dos herois em cache
- animated_text_kit: Utilizei para por um efeito visual na descrição dos herois
- lottie: Utilizei para por uma animação em json na slpashScreen
- mockito: para os testes unitários
