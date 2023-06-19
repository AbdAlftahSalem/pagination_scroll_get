//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <pagination_scroll_get/pagination_scroll_get_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) pagination_scroll_get_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "PaginationScrollGetPlugin");
  pagination_scroll_get_plugin_register_with_registrar(pagination_scroll_get_registrar);
}
