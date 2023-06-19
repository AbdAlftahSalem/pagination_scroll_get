#include "include/pagination_scroll_get/pagination_scroll_get_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "pagination_scroll_get_plugin.h"

void PaginationScrollGetPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  pagination_scroll_get::PaginationScrollGetPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
