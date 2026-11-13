import json

import vl_convert as vlc


spec = {
    "$schema": "https://vega.github.io/schema/vega-lite/v5.json",
    "data": {"values": [{"category": "A", "value": 1}, {"category": "B", "value": 2}]},
    "mark": "bar",
    "encoding": {
        "x": {"field": "category", "type": "nominal"},
        "y": {"field": "value", "type": "quantitative"},
    },
}

vega_spec = vlc.vegalite_to_vega(json.dumps(spec))
assert vega_spec["marks"]

svg = vlc.vegalite_to_svg(json.dumps(spec))
assert "<svg" in svg
assert "A" in svg
assert "B" in svg
