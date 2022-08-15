nut.choice = nut.choice or nil

do
	local charMeta = nut.meta.character

	if (SERVER) then
		function charMeta:updateChoice(value)
			local choice = value
			local client = self:getPlayer()

			if (choice) then
				local attrib = self:getAttribs()

				if (IsValid(client)) then
					netstream.Start(client, "choice", self:getID(), value)

				end
			end

			hook.Run("OnCharChoiceUpdated", client, self, key, value)
		end

		function charMeta:setChoice(value)
			local choice = value

			if (attribute) then
				local client = self:getPlayer()

				if (IsValid(client)) then
					netstream.Start(client, "choice", self:getID(), choice)
				end
			end

			hook.Run("OnCharChoiceUpdated", client, self, value)
		end

	else
		netstream.Hook("choice", function(id, value)
			local character = nut.char.loaded[id]

			if (character) then
				character:setChoice(value)
			end
		end)
	end

	function charMeta:getChoice(key, default)
		return self:getChoice() or default or nil
	end
end