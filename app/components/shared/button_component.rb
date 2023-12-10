# frozen_string_literal: true

class Shared::ButtonComponent < ViewComponent::Base
  attr_reader :style, :color, :options

  def initialize(style:, color:, **options)
    @style = style
    @color = color
    @options = options

    common_classes = "m-2 p-2 no-underline flex justify-center items-center border rounded-sm disabled:opacity-50 disabled:pointer-events-none focus:ring-2 focus:outline-none"
    color_classes = @style == :outline ? outline_colors[@color] : @style == :solid ? solid_colors[@color] : ""
    @options[:class] = "#{common_classes} #{color_classes} #{@options[:class]}"
  end

  private
  def outline_colors
    {
      slate: "border-slate-500 text-slate-500 hover:border-slate-400 hover:text-slate-400 focus:ring-slate-500/50",
      gray: "border-gray-500 text-gray-500 hover:border-gray-400 hover:text-gray-400 focus:ring-gray-500/50",
      zinc: "border-zinc-500 text-zinc-500 hover:border-zinc-400 hover:text-zinc-400 focus:ring-zinc-500/50",
      neutral: "border-neutral-500 text-neutral-500 hover:border-neutral-400 hover:text-neutral-400 focus:ring-neutral-500/50",
      stone: "border-stone-500 text-stone-500 hover:border-stone-400 hover:text-stone-400 focus:ring-stone-500/50",
      red: "border-red-500 text-red-500 hover:border-red-400 hover:text-red-400 focus:ring-red-500/50",
      orange: "border-orange-500 text-orange-500 hover:border-orange-400 hover:text-orange-400 focus:ring-orange-500/50",
      amber: "border-amber-500 text-amber-500 hover:border-amber-400 hover:text-amber-400 focus:ring-amber-500/50",
      yellow: "border-yellow-500 text-yellow-500 hover:border-yellow-400 hover:text-yellow-400 focus:ring-yellow-500/50",
      lime: "border-lime-500 text-lime-500 hover:border-lime-400 hover:text-lime-400 focus:ring-lime-500/50",
      green: "border-green-500 text-green-500 hover:border-green-400 hover:text-green-400 focus:ring-green-500/50",
      emerald: "border-emerald-500 text-emerald-500 hover:border-emerald-400 hover:text-emerald-400 focus:ring-emerald-500/50",
      teal: "border-teal-500 text-teal-500 hover:border-teal-400 hover:text-teal-400 focus:ring-teal-500/50",
      cyan: "border-cyan-500 text-cyan-500 hover:border-cyan-400 hover:text-cyan-400 focus:ring-cyan-500/50",
      sky: "border-sky-500 text-sky-500 hover:border-sky-400 hover:text-sky-400 focus:ring-sky-500/50",
      blue: "border-blue-500 text-blue-500 hover:border-blue-400 hover:text-blue-400 focus:ring-blue-500/50",
      indigo: "border-indigo-500 text-indigo-500 hover:border-indigo-400 hover:text-indigo-400 focus:ring-indigo-500/50",
      violet: "border-violet-500 text-violet-500 hover:border-violet-400 hover:text-violet-400 focus:ring-violet-500/50",
      purple: "border-purple-500 text-purple-500 hover:border-purple-400 hover:text-purple-400 focus:ring-purple-500/50",
      fuchsia: "border-fuchsia-500 text-fuchsia-500 hover:border-fuchsia-400 hover:text-fuchsia-400 focus:ring-fuchsia-500/50",
      pink: "border-pink-500 text-pink-500 hover:border-pink-400 hover:text-pink-400 focus:ring-pink-500/50",
      rose: "border-rose-500 text-rose-500 hover:border-rose-400 hover:text-rose-400 focus:ring-rose-500/50",
    }
  end

  def solid_colors
    {
      slate: "border-transparent text-white bg-slate-600 hover:bg-slate-700 focus:ring-slate-500/50",
      gray: "border-transparent text-white bg-gray-600 hover:bg-gray-700 focus:ring-gray-500/50",
      zinc: "border-transparent text-white bg-zinc-600 hover:bg-zinc-700 focus:ring-zinc-500/50",
      neutral: "border-transparent text-white bg-neutral-600 hover:bg-neutral-700 focus:ring-neutral-500/50",
      stone: "border-transparent text-white bg-stone-600 hover:bg-stone-700 focus:ring-stone-500/50",
      red: "border-transparent text-white bg-red-600 hover:bg-red-700 focus:ring-red-500/50",
      orange: "border-transparent text-white bg-orange-600 hover:bg-orange-700 focus:ring-orange-500/50",
      amber: "border-transparent text-white bg-amber-600 hover:bg-amber-700 focus:ring-amber-500/50",
      yellow: "border-transparent text-white bg-yellow-600 hover:bg-yellow-700 focus:ring-yellow-500/50",
      lime: "border-transparent text-white bg-lime-600 hover:bg-lime-700 focus:ring-lime-500/50",
      green: "border-transparent text-white bg-green-600 hover:bg-green-700 focus:ring-green-500/50",
      emerald: "border-transparent text-white bg-emerald-600 hover:bg-emerald-700 focus:ring-emerald-500/50",
      teal: "border-transparent text-white bg-teal-600 hover:bg-teal-700 focus:ring-teal-500/50",
      cyan: "border-transparent text-white bg-cyan-600 hover:bg-cyan-700 focus:ring-cyan-500/50",
      sky: "border-transparent text-white bg-sky-600 hover:bg-sky-700 focus:ring-sky-500/50",
      blue: "border-transparent text-white bg-blue-600 hover:bg-blue-700 focus:ring-blue-500/50",
      indigo: "border-transparent text-white bg-indigo-600 hover:bg-indigo-700 focus:ring-indigo-500/50",
      violet: "border-transparent text-white bg-violet-600 hover:bg-violet-700 focus:ring-violet-500/50",
      purple: "border-transparent text-white bg-purple-600 hover:bg-purple-700 focus:ring-purple-500/50",
      fuchsia: "border-transparent text-white bg-fuchsia-600 hover:bg-fuchsia-700 focus:ring-fuchsia-500/50",
      pink: "border-transparent text-white bg-pink-600 hover:bg-pink-700 focus:ring-pink-500/50",
      rose: "border-transparent text-white bg-rose-600 hover:bg-rose-700 focus:ring-rose-500/50",
    }
  end
end