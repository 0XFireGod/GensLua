local function find_active_char()
	local avatarroot = CS.UnityEngine.GameObject.Find("/EntityRoot/AvatarRoot")
	for i = 0, avatarroot.transform.childCount - 1 do
		local child = avatarroot.transform:GetChild(i)
		if child.gameObject.activeInHierarchy then
			return child.gameObject
		end
	end
end

local function find_body(avatar)
	for i = 0, avatar.transform.childCount - 1 do
		local transform = avatar.transform:GetChild(i)

		if transform.name == "OffsetDummy" then
			return transform
		end
	end
end

local function EmoChanger()
	local avatar = find_active_char()
	CS.MoleMole.ActorUtils.ShowMessage(find_body(avatar):GetChild(0).name)
	local obj = find_body(avatar):GetChild(0)
	local emo = obj:GetComponent("EmoSync")
	emo:SetEmotion("Surprise05",0)
	emo:SetPhoneme("P_TalkAngry331",0)
	emo:EmoFinish()
end

local function onError(error)
	CS.UnityEngine.GameObject.Find("/BetaWatermarkCanvas(Clone)/Panel/TxtUID"):GetComponent("Text").text = tostring(error)
	CS.MoleMole.ActorUtils.ShowMessage(tostring(error))
end

xpcall(EmoChanger, onError)
