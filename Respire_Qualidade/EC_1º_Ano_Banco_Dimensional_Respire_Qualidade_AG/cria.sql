/*
DIMENS�O DE DATA - DI_DATA
O objetivo dessa dimens�o � ter todo o controle de datas, para serem usados em futuros relat�rios
*/

CREATE TABLE [dbo].[DI_DATA](
	[sk_data] [int] NOT NULL, --Surrogate Key no formato AAAMMDD para ser usado como Foreign Key na fato
	[nr_dia] [int] NULL, --Campo com o dado apenas de dia
	[nr_mes] [int] NULL, -- Campo com o dado apenas do m�s (em numeral)
	[nr_ano] [int] NULL, -- Campo com o dado apenas do ano
	[ds_mes] [nvarchar](50) NULL, -- Campo com o dado do m�s (em texto)
	[dt_carga] [date] NULL, -- Campo de controle relacionado com a data de carga (no formato AAAA-MM-DD) dos registros inseridos na dimens�o
	[dt_cntrle_inicio] [datetime] NULL, -- Campo de controle relacionado com a data de quando o registro foi inserido (AAAA-MM-DD HH:MM:SS) para controlar se o registro est� ativo ou inativo
	[dt_cntrle_fim] [datetime] NULL, -- Campo de controle relacionado com a data de quando o registro foi inativado (AAAA-MM-DD HH:MM:SS) para controlar se o registro est� ativo ou inativo
	[in_cntrle_ativo] [char](1) NULL, -- Campo de controle booleano relacionado com o status do registro, se ele est� ativo ou inativo (Y - Yes (ativo), No - N�o (inativo))
 CONSTRAINT [PK_DI_DATA] PRIMARY KEY CLUSTERED 
(
	[sk_data] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

--Constraint para receber apenas os valores Y ou N, pois o campo in_cntrle_ativo � um campo booleano
ALTER TABLE [dbo].[DI_DATA]  WITH CHECK ADD  CONSTRAINT [CK_DI_DATA_in_cntrle_ativo] CHECK  (([in_cntrle_ativo]='N' OR [in_cntrle_ativo]='Y'))


ALTER TABLE [dbo].[DI_DATA] CHECK CONSTRAINT [CK_DI_DATA_in_cntrle_ativo]
;

/*
DIMENS�O RELACIONADA AS ESTA��ES DE MONITORAMENTO DO AR - DI_ESTACAO
O objetivo dessa dimens�o � ter todo o controle das esta��es de monitoramento do ar, atualmente com dados do Estado de S�o Paulo
podendo expandir para ter dados de todos os estados brasileiros
*/

CREATE TABLE [dbo].[DI_ESTACAO](
	[sk_estacao] [int] identity(1,1) NOT NULL, -- Surrogate Key para ser usado como Foreign Key na fato
	[nm_estacao] [varchar](50) NULL, -- Campo com o dado do nome da esta��o de monitoramento
	[ds_cidade_estacao] [varchar](50) NULL, -- Campo com o dado do nome da cidade onde se encontra a esta��o de monitoramento
	[ds_estado_estacao] [varchar](50) NULL, -- Campo com o dado do nome do estado onde se encontra a esta��o de monitoramento
	[sg_estado_estacao] [char](2) NULL, -- Campo com o dado da sigla do estado onde se encontra a esta��o de monitoramento
	[ds_latitude_estacao] [varchar](50) NULL, -- Campo com o dado da altitude da esta��o de monitoramento
	[ds_longitude_estacao] [varchar](50) NULL, -- Campo com o dado da longitude da esta��o de monitoramento
	[dt_carga] [date] NULL, -- Campo de controle relacionado com a data de carga (no formato AAAA-MM-DD) dos registros inseridos na dimens�o
	[dt_cntrle_inicio] [datetime] NULL, -- Campo de controle relacionado com a data de quando o registro foi inserido (AAAA-MM-DD HH:MM:SS) para controlar se o registro est� ativo ou inativo
	[dt_cntrle_fim] [datetime] NULL, -- Campo de controle relacionado com a data de quando o registro foi inativado (AAAA-MM-DD HH:MM:SS) para controlar se o registro est� ativo ou inativo
	[in_cntrle_ativo] [char](1) NULL, -- Campo de controle booleano relacionado com o status do registro, se ele est� ativo ou inativo (Y - Yes (ativo), No - N�o (inativo))
 CONSTRAINT [PK_DI_ESTACAO] PRIMARY KEY CLUSTERED 
(
	[sk_estacao] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


--Constraint para receber apenas os valores Y ou N, pois o campo in_cntrle_ativo � um campo booleano
ALTER TABLE [dbo].[DI_ESTACAO]  WITH CHECK ADD  CONSTRAINT [CK_DI_ESTACAO_in_cntrle_ativo] CHECK  (([in_cntrle_ativo]='N' OR [in_cntrle_ativo]='Y'))


ALTER TABLE [dbo].[DI_ESTACAO] CHECK CONSTRAINT [CK_DI_ESTACAO_in_cntrle_ativo]
;


/*
DIMENS�O DE HORA - DI_HORA
O objetivo dessa dimens�o � ter todo o controle de datas, para serem usados em futuros relat�rios
*/

CREATE TABLE [dbo].[DI_HORA](
	[sk_hr_min_seg] [char](6) NOT NULL, -- Surrogate Key no formato HHMMSS para ser usado como Foreign Key na fato
	[hora] [char](2) NULL, -- Campo com o dado apenas da hora
	[minuto] [char](2) NULL, -- Campo com o dado apenas do minuto
	[segundo] [char](2) NULL, -- Campo com o dado apenas do segundo
	[hr_min_seg] [varchar](15) NULL, -- Campo com o dado de hora, minuto e segundo (HH:MM:SS)
	[hr_min] [varchar](15) NULL, -- Campo com o dado de hora e minuto (HH:MM)
	[dt_carga] [date] NULL, -- Campo de controle relacionado com a data de carga (no formato AAAA-MM-DD) dos registros inseridos na dimens�o
	[dt_cntrle_inicio] [datetime] NULL, -- Campo de controle relacionado com a data de quando o registro foi inserido (AAAA-MM-DD HH:MM:SS) para controlar se o registro est� ativo ou inativo
	[dt_cntrle_fim] [datetime] NULL, -- Campo de controle relacionado com a data de quando o registro foi inativado (AAAA-MM-DD HH:MM:SS) para controlar se o registro est� ativo ou inativo
	[in_cntrle_ativo] [char](1) NULL, -- Campo de controle booleano relacionado com o status do registro, se ele est� ativo ou inativo (Y - Yes (ativo), No - N�o (inativo))
 CONSTRAINT [PK_DI_HORA] PRIMARY KEY CLUSTERED 
(
	[sk_hr_min_seg] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

--Constraint para receber apenas os valores Y ou N, pois o campo in_cntrle_ativo � um campo booleano
ALTER TABLE [dbo].[DI_HORA]  WITH CHECK ADD  CONSTRAINT [CK_DI_HORA_in_cntrle_ativo] CHECK  (([in_cntrle_ativo]='N' OR [in_cntrle_ativo]='Y'))


ALTER TABLE [dbo].[DI_HORA] CHECK CONSTRAINT [CK_DI_HORA_in_cntrle_ativo];

/*
DIMENS�O RELACIONADO AS INFORMA��ES DE INDICE DA QUALIDADE DO AR (IQAR) - DI_IQAR
O objetivo dessa dimens�o � ter todo o controle dos indices usados na estrat�gia (Bom, Ruim, P�ssimo, etc)
*/

CREATE TABLE [dbo].[DI_IQAR](
	[sk_iqar] [int] identity(1,1) NOT NULL, -- Surrogate Key para ser usado como Foreign Key na fato
	[nr_indice] [int] NULL, -- Campo com o dado relacionado ao valor do indice
	[nm_iqar] [varchar](50) NULL, -- Campo com o dado relacionado com o nome do indice
	[nm_poluente] [varchar](20) NULL, -- campo com o dado relacionado ao nome do poluente, porque cada poluentes tem seus valores e ind�ces
	[dt_carga] [date] NULL, -- Campo de controle relacionado com a data de carga (no formato AAAA-MM-DD) dos registros inseridos na dimens�o
	[dt_cntrle_inicio] [datetime] NULL, -- Campo de controle relacionado com a data de quando o registro foi inserido (AAAA-MM-DD HH:MM:SS) para controlar se o registro est� ativo ou inativo
	[dt_cntrle_fim] [datetime] NULL, -- Campo de controle relacionado com a data de quando o registro foi inativado (AAAA-MM-DD HH:MM:SS) para controlar se o registro est� ativo ou inativo
	[in_cntrle_ativo] [char](1) NULL, -- Campo de controle booleano relacionado com o status do registro, se ele est� ativo ou inativo (Y - Yes (ativo), No - N�o (inativo))
 CONSTRAINT [PK_DI_IQAR] PRIMARY KEY CLUSTERED 
(
	[sk_iqar] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

--Constraint para receber apenas os valores Y ou N, pois o campo in_cntrle_ativo � um campo booleano
ALTER TABLE [dbo].[DI_IQAR]  WITH CHECK ADD  CONSTRAINT [CK_DI_IQAR_in_cntrle_ativo] CHECK  (([in_cntrle_ativo]='N' OR [in_cntrle_ativo]='Y'))

ALTER TABLE [dbo].[DI_IQAR] CHECK CONSTRAINT [CK_DI_IQAR_in_cntrle_ativo];

/*
DIMENS�O RELACIONADO AOS POLUENTES DISCUTIDOS NO MONITORAMENTO - DI_POLUENTE
O objetivo dessa dimens�o � ter todo o controle dos tipos de poluentes existentes nos monitoramentos das esta��es
*/

CREATE TABLE [dbo].[DI_POLUENTE](
	[sk_poluente] [int] identity(1,1) NOT NULL, -- Surrogate Key para ser usado como Foreign Key na fato
	[nm_poluente] [varchar](50) NULL, -- Campo com o dado do nome do poluente
	[tp_calculo] [varchar](50) NULL, -- Campo com o dado de como o poluente � calculado
	[dt_carga] [date] NULL, -- Campo de controle relacionado com a data de carga (no formato AAAA-MM-DD) dos registros inseridos na dimens�o
	[dt_cntrle_inicio] [datetime] NULL, -- Campo de controle relacionado com a data de quando o registro foi inserido (AAAA-MM-DD HH:MM:SS) para controlar se o registro est� ativo ou inativo
	[dt_cntrle_fim] [datetime] NULL, -- Campo de controle relacionado com a data de quando o registro foi inativado (AAAA-MM-DD HH:MM:SS) para controlar se o registro est� ativo ou inativo
	[in_cntrle_ativo] [char](1) NULL, -- Campo de controle booleano relacionado com o status do registro, se ele est� ativo ou inativo (Y - Yes (ativo), No - N�o (inativo))
 CONSTRAINT [PK_DI_POLUENTE] PRIMARY KEY CLUSTERED 
(
	[sk_poluente] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

--Constraint para receber apenas os valores Y ou N, pois o campo in_cntrle_ativo � um campo booleano
ALTER TABLE [dbo].[DI_POLUENTE]  WITH CHECK ADD  CONSTRAINT [CK_DI_POLUENTE_in_cntrle_ativo] CHECK  (([in_cntrle_ativo]='N' OR [in_cntrle_ativo]='Y'))

ALTER TABLE [dbo].[DI_POLUENTE] CHECK CONSTRAINT [CK_DI_POLUENTE_in_cntrle_ativo];

/*
FATO CRIADA COM OS RELACIONAMENTOS DAS DIMENS�ES DESCRITAS ACIMA - FT_MONITORAMENTO_AR
A fato foi criada para a visualiza��o de todos os dados relacionados ao monitoramento do ar
*/

CREATE TABLE [dbo].[FT_MONITORAMENTO_AR](
	[sk_data] [int] NOT NULL, -- Foreign Key da dimens�o DI_DATA
	[sk_estacao] [int] NOT NULL, -- Foreign Key da dimens�o DI_ESTACAO
	[sk_iqar] [int] NOT NULL, -- Foreign Key da dimens�o DI_IQAR
	[sk_poluente] [int] NOT NULL, -- Foreign Key da dimens�o DI_POLUENTE
	[dt_monitoramento] [varchar](10) NOT NULL, -- Dado relacionado a data em que o monitoramento foi realizado
	[qt_total_indice_qld_ar] [int] NULL, -- Campo com o dado quantitativo do indice di�rio da esta��o
	[nr_temperatura] [numeric](7, 3) NULL, -- Campo com o dado m�dio da temperatura
	[nr_umidade] [numeric](7, 3) NULL, -- Campo com o dado m�dio da press�o
	[nr_pressao] [numeric](7, 3) NULL, -- Campo com o dado m�dio da umidade do ar
	[dt_carga] [date] NULL, -- Campo de controle relacionado com a data de carga (no formato AAAA-MM-DD) dos registros inseridos na dimens�o
	[dt_ultima_atualizacao] [datetime] NULL, -- Campo de controle com o dado da �ltima altera��o realizada no registro
 
 -- Chave prim�ria composta com todas as SK das dimens�es
 CONSTRAINT [PK_FT_MONITORAMENTO_AR] PRIMARY KEY CLUSTERED 
(
	[sk_poluente] ASC,
	[sk_estacao] ASC,
	[sk_iqar] ASC,
	[sk_data] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

-- Relacionamento com a dimens�o de data (DI_DATA)
ALTER TABLE [dbo].[FT_MONITORAMENTO_AR]  WITH CHECK ADD  CONSTRAINT [FK_FT_MONITORAMENTO_AR_sk_data] FOREIGN KEY([sk_data])
REFERENCES [dbo].[DI_DATA] ([sk_data])

ALTER TABLE [dbo].[FT_MONITORAMENTO_AR] CHECK CONSTRAINT [FK_FT_MONITORAMENTO_AR_sk_data]

-- Relacionamento com a dimens�o de esta��o (DI_ESTACAO)
ALTER TABLE [dbo].[FT_MONITORAMENTO_AR]  WITH CHECK ADD  CONSTRAINT [FK_FT_MONITORAMENTO_AR_sk_estacao] FOREIGN KEY([sk_estacao])
REFERENCES [dbo].[DI_ESTACAO] ([sk_estacao])

ALTER TABLE [dbo].[FT_MONITORAMENTO_AR] CHECK CONSTRAINT [FK_FT_MONITORAMENTO_AR_sk_estacao]

-- Relacionamento com a dimens�o de ind�ce (DI_INDICE)
ALTER TABLE [dbo].[FT_MONITORAMENTO_AR]  WITH CHECK ADD  CONSTRAINT [FK_FT_MONITORAMENTO_AR_sk_iqar] FOREIGN KEY([sk_iqar])
REFERENCES [dbo].[DI_IQAR] ([sk_iqar])

ALTER TABLE [dbo].[FT_MONITORAMENTO_AR] CHECK CONSTRAINT [FK_FT_MONITORAMENTO_AR_sk_iqar]

-- Relacionamento com a dimens�o de poluente (DI_POLUENTE)
ALTER TABLE [dbo].[FT_MONITORAMENTO_AR]  WITH CHECK ADD  CONSTRAINT [FK_FT_MONITORAMENTO_AR_sk_poluente] FOREIGN KEY([sk_poluente])
REFERENCES [dbo].[DI_POLUENTE] ([sk_poluente])

ALTER TABLE [dbo].[FT_MONITORAMENTO_AR] CHECK CONSTRAINT [FK_FT_MONITORAMENTO_AR_sk_poluente]

