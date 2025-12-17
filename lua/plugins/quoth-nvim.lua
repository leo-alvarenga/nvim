local quotes = {
	{
		author = "Commander Adama (Battlestar Galactica)",
		text = "Sometimes you have to roll a hard six",
		tags = { "risk", "courage", "determination", "leadership" },
	},
	{
		author = "Commander Adama (Battlestar Galactica)",
		text = "It's not enough to survive. One must be worthy of survival",
		tags = { "purpose", "honor", "resilience", "values" },
	},
	{
		author = "Commander Adama (Battlestar Galactica)",
		text = "Our only hope is to remain undivided",
		tags = { "unity", "strength", "solidarity", "survival" },
	},
	{
		author = "Commander Adama (Battlestar Galactica)",
		text = "You cannot play God then wash your hands of the things that you've created",
		tags = { "responsibility", "consequences", "accountability", "ethics" },
	},
	{
		author = "Commander Adama (Battlestar Galactica)",
		text = "Fight and you live. Run and you'll just die tired",
		tags = { "courage", "action", "survival", "resolve" },
	},
	{
		author = "Number Six (Battlestar Galactica)",
		text = "All this has happened before, and all this will happen again",
		tags = { "cycles", "fate", "history", "inevitability" },
	},
	{
		author = "Dave Mustaine (Megadeth - A Tout le Monde)",
		text = "Don't remember me when I'm gone",
		tags = { "legacy", "forgetting", "existential", "release" },
	},
	{
		author = "Tom Araya (Slayer - Raining Blood)",
		text = "Trapped in purgatory, a lifeless object, alive",
		tags = { "limbo", "existence", "torment", "paradox" },
	},
	{
		author = "Tom Araya (Slayer - War Ensemble)",
		text = "Propaganda death ensemble, burial to be",
		tags = { "war", "deception", "destruction", "inevitability" },
	},
	{
		author = "George Fisher (Cannibal Corpse - Hammer Smashed Face)",
		text = "I feel the pain, but I live through it",
		tags = { "endurance", "pain", "resilience", "brutality" },
	},
	{
		author = "Chuck Schuldiner (Death - Symbolic)",
		text = "Spiritual supremacy, through mental harmony",
		tags = { "spirit", "mind", "harmony", "transcendence" },
	},
	{
		author = "Chuck Schuldiner (Death - The Sound of Perseverance)",
		text = "Pain is only a pulse, it has no real power",
		tags = { "pain", "powerless", "perspective", "strength" },
	},

	{
		author = "Tomas Lindberg (At The Gates - Slaughter of the Soul)",
		text = "To end the cycle of violence, we must end the cycle of silence",
		tags = { "silence", "violence", "cycle", "action" },
	},
	{
		author = "Commander Adama (Battlestar Galactica)",
		text = "There's a reason you separate military and the police. One fights the enemies of the state, the other serves the people",
		tags = { "duty", "separation", "service", "power" },
	},
	{
		author = "Gaius Baltar (Battlestar Galactica)",
		text = "Sometimes you have to make difficult decisions for the greater good",
		tags = { "sacrifice", "greatergood", "morality", "leadership" },
	},

	{
		author = "Chuck Schuldiner (Death - Voice of the Soul)",
		text = "Reflect the day, through your own eyes",
		tags = { "reflection", "perspective", "self", "insight" },
	},
	{
		author = "Karl Willetts (Bolt Thrower - ...For Victory)",
		text = "In war there is no surrender, the fight goes on forever",
		tags = { "war", "endless", "fight", "commitment" },
	},
	{
		author = "Commander Adama (Battlestar Galactica)",
		text = "So say we all!",
		tags = { "unity", "affirmation", "solidarity", "strength" },
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
