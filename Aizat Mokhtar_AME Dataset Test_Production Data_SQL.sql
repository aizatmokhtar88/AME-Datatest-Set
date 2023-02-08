/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [DATEPRD]
      ,[WELL_BORE_CODE]
      ,[NPD_WELL_BORE_CODE]
      ,[NPD_WELL_BORE_NAME]
      ,[NPD_FIELD_CODE]
      ,[NPD_FIELD_NAME]
      ,[NPD_FACILITY_CODE]
      ,[NPD_FACILITY_NAME]
      ,[ON_STREAM_HRS]
      ,[AVG_DOWNHOLE_PRESSURE]
      ,[AVG_DOWNHOLE_TEMPERATURE]
      ,[AVG_DP_TUBING]
      ,[AVG_ANNULUS_PRESS]
      ,[AVG_CHOKE_SIZE_P]
      ,[AVG_CHOKE_UOM]
      ,[AVG_WHP_P]
      ,[AVG_WHT_P]
      ,[DP_CHOKE_SIZE]
      ,[BORE_OIL_VOL]
      ,[BORE_GAS_VOL]
      ,[BORE_WAT_VOL]
      ,[BORE_WI_VOL]
      ,[FLOW_KIND]
      ,[WELL_TYPE]
  FROM [DatasetTest].[dbo].[production_data_volve]

  SELECT COUNT(WELL_BORE_CODE) AS recordCount, 
  CONCAT(WELL_TYPE,' ', FLOW_KIND) AS wellType,
  MIN(AVG_DOWNHOLE_TEMPERATURE) AS minDownholeTemp,
  MAX(AVG_ANNULUS_PRESS) AS maxAnnulusPress,
  AVG(AVG_DP_TUBING) AS avgDpTubing,
  SUM(BORE_OIL_VOL) AS totalOilVolume,
  SUM(BORE_GAS_VOL) AS totalGasVolume,
  SUM(BORE_WAT_VOL) AS totalWaterVolume 
  FROM [DatasetTest].[dbo].[production_data_volve] 
  GROUP BY CONCAT(WELL_TYPE,' ', FLOW_KIND)
  ORDER BY totalOilVolume DESC, totalGasVolume DESC, totalWaterVolume DESC;
  