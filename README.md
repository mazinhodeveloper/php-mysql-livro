# Construindo Aplicações Web com PHP e MySQL   
Descrição do livro: A construção de sites e aplicações cresce de forma acelerada na internet e, por trás de grande parte desses projetos, o PHP e o MySQL são utilizados por serem tecnologias muito eficientes e terem sido criados visando este nicho de mercado: aplicações web (intranet e internet).   
https://novatec.com.br/livros/aplicacoes-web-com-php-mysql-1ed   

## GitHub / Construindo Aplicações Web com PHP e MySQL - 1ª Edição    
https://github.com/mazinhodeveloper/curso-logica-programacao-php   

### Projeto   
| Requisitos do Projeto      | URL                           |   
|--------------------------- | ----------------------------- |   
| PHP 8.2 ou maior           | https://www.php.net           |   
| MySQL                      | https://www.mysql.com         |   
| XAMPP                      | https://www.apachefriends.org |   
| Docker                     | https://www.docker.com        |   

### Docker / Criando os containers 
docker compose up -d --build 

### Rodando o Projeto 
| Diretório             | URL                   |  
|---------------------- |---------------------- |  
| Endereço URL          | http://localhost:8090 |   
| Banco de Dados        | http://localhost:8091 |   

### Parando todos os containers 
docker stop $(docker ps -aq) 

### Removendo todos os containers 
docker rm $(docker ps -aq) 

### Removendo todas as imagens 
docker rmi $(docker images -aq) 


### Todas as images 
docker images 

### Listando as imagens que estão rodando 
docker ps 

### Listando todas as imagens 
docker ps -a 

### Parando os containers 
docker compose stop 
