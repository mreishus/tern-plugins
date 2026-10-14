--!strict
-- Tern's tiles layout pins #tabbar (height var(--tn-bar)) to the top and starts
-- #panel just under it; html.tn-status adds a 26px #statusline at the bottom.
-- Flip it: tab bar at the bottom (above the status line when shown), and leave
-- a strip at the top for the macOS traffic lights.
tern.css("layout", [[
html.lay-tiles.tabs-h {
	--tbb-top: 28px;
	--tbb-status: 0px;

	#tabbar {
		top: auto !important;
		bottom: var(--tbb-status) !important;
		padding-left: 12px !important;
	}
	#panel {
		top: var(--tbb-top) !important;
		bottom: calc(var(--tn-bar) + var(--tbb-status) * var(--tn-zoom, 1) - 3px) !important;
	}
}
html.lay-tiles.tabs-h.tn-status {
	--tbb-status: 26px;

	.tn-stage { bottom: 0 !important; }
}
]])
