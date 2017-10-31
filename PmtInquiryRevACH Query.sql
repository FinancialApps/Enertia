SELECT  BAT.BankTxnTID
FROM	brMasBankAcctTxn BAT INNER JOIN brMasBankAcct BA  ON BAT.BankAcctTID = BA.BankAcctTID
		LEFT JOIN brMasPmtMthd Pmt  ON BAT.BankTxnPmtMthdTID = Pmt.PmtMthdTID
WHERE	(PMT.PmtProcessType = 'MmsPmtProcess'  
		AND BAT.BankTxnType  IN ('ACHOUT', 'WIREOUT') 
		--Corp 06
		AND Pmt.PmtCorpHID IN (1066146)   
		AND ISNULL(BAT.BankTxnComment, '') <> 'System Generated Void' 
		AND BAT.BankTxnStatus = 'ISSUED')  
		

--Get Revenue Payments and put IDs in a table in the AppSupport database		
SELECT	BAT.BankTxnTID
INTO	AppSupport.dbo.RevenueACHPmts
		--SUM(BankTxnAmount)
FROM	brMasBankAcctTxn BAT INNER JOIN brMasBankAcct BA  ON BAT.BankAcctTID = BA.BankAcctTID
		LEFT JOIN brMasPmtMthd Pmt  ON BAT.BankTxnPmtMthdTID = Pmt.PmtMthdTID
WHERE	(PMT.PmtProcessType = 'RevPmtProcess'  
		AND BAT.BankTxnType  IN ('ACHOUT') 
		--Corp 06
		AND Pmt.PmtCorpHID IN (1066146)   
		AND ISNULL(BAT.BankTxnComment, '') <> 'System Generated Void' 
		AND BAT.BankTxnStatus = 'ISSUED')  		
		
 
-- banktxntid 

--Get currently used bank statuses
--SELECT DISTINCT BANKTXNSTATUS FROM brMasBankAcctTxn



ADDING SOME STUFF HERE FOR TESTING
more changes
