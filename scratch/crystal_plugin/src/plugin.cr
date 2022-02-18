@[Link("nvelox")]
lib C
  fun nv_out_msg(msg : UInt8*)
end

fun nvelox_plugin_init = nvelox_plugin_init : Void
  GC.init
  LibCrystalMain.__crystal_main(0, Pointer(Pointer(UInt8)).null)
  C.nv_out_msg("crystal")
end
