//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <dart_duckdb/dart_duckdb_plugin_c_api.h>
#include <screen_retriever_windows/screen_retriever_windows_plugin_c_api.h>
#include <window_manager/window_manager_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  DartDuckdbPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("DartDuckdbPluginCApi"));
  ScreenRetrieverWindowsPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ScreenRetrieverWindowsPluginCApi"));
  WindowManagerPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("WindowManagerPlugin"));
}
