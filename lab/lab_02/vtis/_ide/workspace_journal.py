# 2026-11-12T14:39:49.841660700
import vitis

client = vitis.create_client()
client.set_workspace(path="vtis")

advanced_options = client.create_advanced_options_dict(dt_overlay="0")

platform = client.create_platform_component(name = "micro_blaze",hw_design = "$COMPONENT_LOCATION/../../microblaze/microblaze_wrapper.xsa",os = "standalone",cpu = "microblaze_0",domain_name = "standalone_microblaze_0",generate_dtb = False,advanced_options = advanced_options,compiler = "gcc")

platform = client.get_component(name="micro_blaze")
status = platform.build()

comp = client.create_app_component(name="hello_world",platform = "$COMPONENT_LOCATION/../micro_blaze/export/micro_blaze/micro_blaze.xpfm",domain = "standalone_microblaze_0")

status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

status = platform.build()

comp.build()

