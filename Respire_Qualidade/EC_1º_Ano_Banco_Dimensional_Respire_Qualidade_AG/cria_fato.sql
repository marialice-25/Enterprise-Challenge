/*
Script de criação da fato
*/

insert into [FT_MONITORAMENTO_AR](
[sk_data]
,[sk_estacao]
,[sk_iqar]
,[sk_poluente]
,[dt_monitoramento]
,[qt_total_indice_qld_ar]
,[dt_carga]
,[dt_ultima_atualizacao]
)(
SELECT  ISNULL(DTA.sk_data, '-1')			AS sk_data
		, ISNULL(EST.sk_estacao, '-1')		AS sk_estacao
		, ISNULL(IQAR.sk_iqar , '-1')		AS sk_iqar
		, ISNULL(POL.sk_poluente , '-1')	AS sk_poluente
		, FORMAT(STG.dt_completa,'d', 'pt-BR')		AS dt_monitoramento	
		, SUM(STG.nr_iqar)					AS qt_total_indice_qld_ar
		, CONVERT(DATE, GETDATE())			AS DT_CRGA 
		, GETDATE()							AS DT_ULTMA_ATLZCAO

		FROM [STG_TXT_MONITORAMENTO_AR_IEMA] STG WITH(NOLOCK)
		LEFT JOIN DI_DATA DTA WITH(NOLOCK) on (REPLACE(STG.dt_completa,'-','') = DTA.sk_data)
		LEFT JOIN DI_ESTACAO EST WITH(NOLOCK) ON (STG.nm_estacao = EST.nm_estacao)
		LEFT JOIN DI_IQAR IQAR WITH(NOLOCK) ON (STG.nr_iqar = IQAR.nr_indice AND STG.ds_poluente = IQAR.nm_poluente)
		LEFT JOIN DI_POLUENTE POL WITH(NOLOCK) ON (STG.ds_poluente = POL.nm_poluente)
		WHERE STG.nr_iqar IS NOT NULL
		GROUP BY DTA.sk_data, EST.sk_estacao , IQAR.sk_iqar, POL.sk_poluente, STG.dt_completa)

