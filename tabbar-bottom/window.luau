--!strict
-- Moves the tab bar to the bottom for Tern's horizontal-tab layouts (tiles,
-- studio, float). Each pins #tabbar (height var(--tn-bar)) to the top; we pin
-- it to the bottom instead, above the 26px #statusline when html.tn-status is
-- set, and leave a strip at the top for the macOS traffic lights.
--
-- #tabbar is zoomed by var(--tn-zoom), so its offsets are in unzoomed px;
-- #panel and .tn-stage are not, so theirs multiply by the zoom.
tern.css("layout", [[
html.tabs-h:is(.lay-tiles, .lay-studio, .lay-float) {
	--tbb-top: 28px;
	--tbb-status: 0px;
	--tbb-bottom: calc(var(--tn-bar) + var(--tbb-status) * var(--tn-zoom, 1));

	#tabbar {
		top: auto !important;
		bottom: var(--tbb-status) !important;
	}
	&.tn-status {
		--tbb-status: 26px;
	}

	/* The strip left at the top drags the window. #tn-band is Tern's own
	   drag band, normally shown only for auto-hiding vertical tabs. */
	#tn-band {
		display: block;
		position: fixed;
		z-index: 11;
		top: 0;
		left: 0;
		right: 0;
		height: var(--tbb-top);
		-webkit-app-region: drag;
	}
	&.lay-studio.dense-islands #tn-band {
		height: calc(var(--tbb-top) - 4px);
	}
}

/* Tiles: #panel sits between the bars and its stage fills it. */
html.lay-tiles.tabs-h {
	#tabbar { padding-left: 12px !important; }
	#panel {
		top: var(--tbb-top) !important;
		bottom: calc(var(--tbb-bottom) - 3px) !important;
	}
	.tn-stage { bottom: 0 !important; }
}

/* Studio: #panel fills the window and .tn-stage leaves room for the bars. */
html.lay-studio.tabs-h {
	#tabbar { padding-left: 6px !important; }
	.tn-stage {
		top: var(--tbb-top) !important;
		bottom: var(--tbb-bottom) !important;
	}
	&.dense-islands .tn-stage {
		top: calc(var(--tbb-top) - 4px) !important;
		bottom: calc(var(--tbb-bottom) - 4px) !important;
	}
}

/* Float: same as studio, and the pill hides downward instead of upward. */
html.lay-float.tabs-h {
	.tn-stage {
		top: var(--tbb-top) !important;
		bottom: var(--tbb-bottom) !important;
	}
	.tb-in.tn-typing:not(:focus-within) {
		transform: translateY(6px) !important;
	}
}
]])
