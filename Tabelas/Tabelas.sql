CREATE TABLE Funcionario(    
	Cod_Funcionario SERIAL PRIMARY KEY,    
	CPF_Funcionario VARCHAR(14) NOT NULL UNIQUE,    
	Nome_Funcionario VARCHAR(100) NOT NULL,    
	Cargo VARCHAR(50) NOT NULL    
); 

CREATE TABLE Cliente(   
	Cod_Cliente SERIAL PRIMARY KEY,
	CPF_Cliente VARCHAR(14) NOT NULL UNIQUE,   
	Data_Nascimento DATE NOT NULL,   
	Nome_Cliente VARCHAR(100) NOT NULL,   
	CEP VARCHAR(9) NOT NULL,   
	Rua VARCHAR(50) NOT NULL,   
	Bairro VARCHAR (50),   
	Numero SMALLINT   
);

CREATE TABLE Equipamento(   
	Cod_Equipamento SERIAL PRIMARY KEY,   
	Nome_Equipamento VARCHAR(100) NOT NULL,   
	Situacao BOOLEAN NOT NULL,   
	Marca VARCHAR(100) NOT NULL,   
	Estado_Conservacao VARCHAR(100) NOT NULL,
	Preco DECIMAL(10,2) NOT NULL
); 

CREATE TABLE Entrega(    
	Cod_Entrega SERIAL PRIMARY KEY,    
	Cod_Funcionario INTEGER REFERENCES Funcionario(Cod_Funcionario),    
	Data_Entrega DATE NOT NULL,    
	CEP VARCHAR(9) NOT NULL,    
	Rua VARCHAR(50),    
	Bairro VARCHAR(50),    
	Numero SMALLINT    
);    


CREATE TABLE Contrato(    
	Cod_Contrato SERIAL PRIMARY KEY,    
	Cod_Funcionario INTEGER REFERENCES FUNCIONARIO(COD_FUNCIONARIO),  
	Cod_Cliente INTEGER REFERENCES CLIENTE(COD_CLIENTE),    
	Valor DECIMAL(10,2) NOT NULL,    
	Data_Inicio DATE NOT NULL,    
	Data_Fim DATE NOT NULL    
);    

CREATE TABLE PedidoLocacao(   
	Cod_PedidoLocacao SERIAL PRIMARY KEY,   
	Cod_Contrato INTEGER REFERENCES Contrato(Cod_Contrato)  
); 

CREATE TABLE ItemPedido(   
	Cod_ItemPedido SERIAL,   
	Cod_Equipamento INTEGER REFERENCES Equipamento(Cod_Equipamento), 
	Quantidade INTEGER NOT NULL, 
	Preco_ItemPedido DECIMAL(10,2) NOT NULL,
	Cod_PedidoLocacao INTEGER REFERENCES PedidoLocacao(Cod_PedidoLocacao),  
	Cod_Entrega INTEGER REFERENCES Entrega(Cod_Entrega),  
	PRIMARY KEY (Cod_ItemPedido,Cod_Equipamento)   
);  
