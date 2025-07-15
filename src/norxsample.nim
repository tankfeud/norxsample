## This is a trivial Norx sample
import norx

proc Update(clockInfo: ptr orxCLOCK_INFO, context: pointer) {.cdecl.} =
  ## Update function, it has been registered to be called every tick of the core clock
  if isActive("Quit"):
    # Send close event
    echo "User quitting"
    discard eventSendShort(EVENT_TYPE_SYSTEM, SYSTEM_EVENT_CLOSE.orxU32)

proc init(): orxSTATUS {.cdecl.} =
  ## Init function, it is called when all orx's modules have been initialized
  orxLOG("Sample starting")

  # Create the viewport
  discard viewportCreateFromConfig("MainViewport")
  
  # Create the scene
  discard objectCreateFromConfig("Scene")

  # Register the Update function to the core clock
  let clock = clockGet(CLOCK_KZ_CORE)
  discard clockRegister(clock, Update, nil, MODULE_ID_MAIN, CLOCK_PRIORITY_NORMAL)

  # Done!
  return STATUS_SUCCESS

proc run(): orxSTATUS {.cdecl.} =
  ## Run function, it should not contain any game logic
  return STATUS_SUCCESS

proc exit() {.cdecl.} =
  ## Exit function, it is called before exiting from orx
  echo "Exit called"

proc bootstrap(): orxSTATUS {.cdecl.} =
  ## Bootstrap function, it is called before config is initialized, allowing for early resource storage definitions
  # Add a config storage to find the initial config file
  addStorage(CONFIG_KZ_RESOURCE_GROUP, "data/config", false)

when isMainModule:
  # Set the bootstrap function to provide at least one resource storage before loading any config files
  discard setBootstrap(bootstrap)

  # Execute our game
  execute(init, run, exit)

  # Done!
  quit(0)