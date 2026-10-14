--!strict
-- Replaces "Open scrollback in editor" (TextEdit) with nvim in a split.
-- nvim fills its buffer from `tern capture --scrollback` (the plugin read API
-- stops at the last 2000 lines) and jumps to the end.

local SPLIT: "right" | "down" | "left" | "up" = "right"

local function quote(s: string): string
	return "'" .. s:gsub("'", "'\\''") .. "'"
end

tern.override("open_scrollback", function(cx)
	local pane = cx.session:focused()
	local info = if pane then cx.session:pane(pane) else nil
	if not pane or not info or info.kind ~= "terminal" then
		return false
	end

	local capture = `silent %!tern capture {pane} --scrollback`
	local split = cx.layout:split(pane, SPLIT, { cwd = info.cwd }, { focus = true })
	if not split then
		return false
	end
	-- A plain shell split typed into, not Launch.command: those panes are
	-- treated as agents and stay open after nvim quits. `exec` closes the
	-- pane with nvim; the leading space keeps it out of shell history.
	cx:run(split, ` exec nvim -c {quote(capture)} -c 'setlocal nomodified' -c 'normal! G'\r`)
	-- Focus again once the handler is done: closing the palette hands focus
	-- back to the pane it was opened from.
	cx.layout:focus(split)
	tern.timer(100, function(tcx)
		if tcx then
			tcx.layout:focus(split)
		end
	end)
	return true
end)
