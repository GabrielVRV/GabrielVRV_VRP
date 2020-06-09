local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
emP = {}
Tunnel.bindInterface("vrp_gdinheirovrv",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Guardar dinheiro
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('gdinheiro',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local qnt = vRP.getMoney(playerID)
	
	local valor = vRP.prompt(source,"Valor:","")
	
		if id == "" or valor == "" then
			return
		end
		
		local teste = parseInt(valor)
		local teste2 = parseInt(qnt)
		
		if	vRP.tryPayment(user_id,parseInt(valor)) then
			vRP.giveInventoryItem(user_id,"dinheiroguardado", valor)	
			TriggerClientEvent("Notify",source,"sucesso","Você guardou R$"..parseInt(valor)..".")
		else
			TriggerClientEvent("Notify",source,"negado","Você não tem R$"..parseInt(valor).." na mão.")
		end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Voltar dinheiro
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('usardinheiro',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local qnt = vRP.getMoney(playerID)
	
	local valor = vRP.prompt(source,"Valor:","")
	
		if id == "" or valor == "" then
			return
		end
		
		if	vRP.tryGetInventoryItem(user_id,"dinheiroguardado",parseInt(valor)) then
			vRP.giveMoney(user_id,parseInt(valor))			
			TriggerClientEvent("Notify",source,"sucesso","Você pode usar os R$"..parseInt(valor)..".")
		else
			TriggerClientEvent("Notify",source,"negado","Você não tem R$"..parseInt(valor).." guardado no inventario.")
		end
end)