# frozen_string_literal: true

class Shared::BadgeComponent < ViewComponent::Base
  def initialize(color:, large:, border:, rounded:)
    @color = color
    @large = large
    @border = border
    @rounded = rounded
  end

  def badge_class
    classes = "font-medium inline-flex items-center justify-center"
    classes += " #{@large ? "px-2 py-1 text-sm" : "px-1 py-0.5 text-xs"}"
    classes += " #{@border ? "border #{bordered_colors[@color]}" : colors[@color]}"
    classes += " #{@rounded ? "rounded-full" : "rounded-sm"}"
    classes
  end

  def colors
    {
    	slate:   "bg-slate-200 text-slate-800",
    	gray:    "bg-gray-200 text-gray-800",
    	zinc:    "bg-zinc-200 text-zinc-800",
    	neutral: "bg-neutral-200 text-neutral-800",
    	stone:   "bg-stone-200 text-stone-800",
    	red:     "bg-red-200 text-red-800",
    	orange:  "bg-orange-200 text-orange-800",
    	amber:   "bg-amber-200 text-amber-800",
    	yellow:  "bg-yellow-200 text-yellow-800",
    	lime:    "bg-lime-200 text-lime-800",
    	green:   "bg-green-200 text-green-800",
    	emerald: "bg-emerald-200 text-emerald-800",
    	teal:    "bg-teal-200 text-teal-800",
    	cyan:    "bg-cyan-200 text-cyan-800",
    	sky:     "bg-sky-200 text-sky-800",
    	blue:    "bg-blue-200 text-blue-800",
    	indigo:  "bg-indigo-200 text-indigo-800",
    	violet:  "bg-violet-200 text-violet-800",
    	purple:  "bg-purple-200 text-purple-800",
    	fuchsia: "bg-fuchsia-200 text-fuchsia-800",
    	pink:    "bg-pink-200 text-pink-800",
    	rose:    "bg-rose-200 text-rose-800",
    	none:    ""
    }
  end

  def bordered_colors
    {
    	slate:   "bg-slate-200 text-slate-900 border-slate-500",
    	gray:    "bg-gray-200 text-gray-900 border-gray-500",
    	zinc:    "bg-zinc-200 text-zinc-900 border-zinc-500",
    	neutral: "bg-neutral-200 text-neutral-900 border-neutral-500",
    	stone:   "bg-stone-200 text-stone-900 border-stone-500",
    	red:     "bg-red-200 text-red-900 border-red-400",
    	orange:  "bg-orange-200 text-orange-900 border-orange-400",
    	amber:   "bg-amber-200 text-amber-900 border-amber-400",
    	yellow:  "bg-yellow-200 text-yellow-900 border-yellow-400",
    	lime:    "bg-lime-200 text-lime-900 border-lime-400",
    	green:   "bg-green-200 text-green-900 border-green-400",
    	emerald: "bg-emerald-200 text-emerald-900 border-emerald-400",
    	teal:    "bg-teal-200 text-teal-900 border-teal-400",
    	cyan:    "bg-cyan-200 text-cyan-900 border-cyan-400",
    	sky:     "bg-sky-200 text-sky-900 border-sky-400",
    	blue:    "bg-blue-200 text-blue-900 border-blue-400",
    	indigo:  "bg-indigo-200 text-indigo-900 border-indigo-400",
    	violet:  "bg-violet-200 text-violet-900 border-violet-400",
    	purple:  "bg-purple-200 text-purple-900 border-purple-400",
    	fuchsia: "bg-fuchsia-200 text-fuchsia-900 border-fuchsia-400",
    	pink:    "bg-pink-200 text-pink-900 border-pink-400",
    	rose:    "bg-rose-200 text-rose-900 border-rose-400",
    	none:    ""
    }
  end
end
