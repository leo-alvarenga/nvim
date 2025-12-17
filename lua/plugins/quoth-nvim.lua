local quotes = {
	{
		author = "Signs of the Swarm (Vital Deprivation)",
		text = "Flesh and gods alike, all shall perish",
		tags = { "mortality", "nihilism", "inevitability" },
	},
	{
		author = "Signs of the Swarm (Vital Deprivation)",
		text = "As the mortal compass lies shattered",
		tags = { "existential", "decay", "dread" },
	},
	{
		author = "Signs of the Swarm (Vital Deprivation)",
		text = "Stare into oblivion",
		tags = { "void", "confrontation", "mortality" },
	},
	{
		author = "Signs of the Swarm (Vital Deprivation)",
		text = "Face mortality",
		tags = { "existential", "awareness", "inevitability" },
	},
	{
		author = "Signs of the Swarm (Exhausted Legions)",
		text = "Hollow and numb abandon this useless fucking world",
		tags = { "alienation", "existential", "nihilism" },
	},
	{
		author = "Signs of the Swarm (Exhausted Legions)",
		text = "In the end there is no savior",
		tags = { "nihilism", "void", "truth" },
	},
	{
		author = "Cannibal Corpse (Staring Through the Eyes of the Dead)",
		text = "They said I have died, I still feel alive",
		tags = { "mortality", "awareness", "paradox" },
	},
	{
		author = "Cannibal Corpse (Staring Through the Eyes of the Dead)",
		text = "My soul can't escape the boundary of my flesh",
		tags = { "body", "self", "constraint" },
	},
	{
		author = "Bodysnatcher (Infested)",
		text = "I've bled before, I'll bleed again",
		tags = { "suffering", "cycle", "endurance" },
	},
	{
		author = "Bodysnatcher (Infested)",
		text = "An endless war to break the walls of perception",
		tags = { "perception", "conflict", "existential" },
	},
	{
		author = "Bodysnatcher (Infested)",
		text = "My self inflicted decline",
		tags = { "self", "descent", "identity" },
	},
	{
		author = "Bodysnatcher (Infested)",
		text = "We're meant to suffer in the noise",
		tags = { "suffering", "existence", "nihilism" },
	},
	{
		author = "Bodysnatcher (Infested)",
		text = "A parasite of the mind",
		tags = { "mind", "internal conflict", "identity" },
	},
	{
		author = "Bodysnatcher (Infested)",
		text = "Shackled by static in this somber chamber",
		tags = { "constraint", "isolation", "existential" },
	},
}

return {
	"leo-alvarenga/quoth.nvim",
	-- dir = "~/dev/quoth.nvim",
	opts = {
		custom_quotes = quotes,
		filter = {
			length_constraints = {
				max = 80,
			},
		},
		include_all = false,
	},
	branch = "nightly",
}
