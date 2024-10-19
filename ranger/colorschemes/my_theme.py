from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import (
    default_colors,
    reverse,
    bold
)



class CustomTheme(ColorScheme):
    def use(self, context):
        fg, bg, attr = default_colors
        
        accent1 = 42   # Близок к #3dd3a5 (зелёный)
        accent2 = 198  # Близок к #ff4da6 (розовый)
        accent3 = 130  # Близок к #9f6f17 (жёлто-коричневый)
        accent4 = 124  # Близок к #8e1c1c (красный)
        accent5 = 62   # Близок к #6363c4 (синий)
        accent6 = 61   # Близок к #5353ab (фиолетовый)
        accent7 = 60   # Близок к #43438e (тёмный фиолетовый)
        accent8 = 54   # Близок к #343457 (тёмный синий)

        if context.reset:
            return default_colors

        if context.in_browser:
            if context.selected:
                attr = reverse
            if context.directory:
                fg = accent5  # Директории — синий
            elif context.executable and not context.directory:
                fg = accent6  # Исполняемые файлы — фиолетовый
            elif context.audio or context.video:
                fg = accent2  # Аудио и видео — розовый
            elif context.image:
                fg = accent1  # Изображения — зелёный
            elif context.document:
                fg = accent3  # Документы — жёлто-коричневый
            elif context.link:
                fg = accent7  # Символические ссылки — тёмный фиолетовый
            else:
                fg = accent8  # Все остальные файлы — тёмный синий

        if context.in_titlebar:
            attr |= bold
            fg = accent5

        if context.in_statusbar:
            if context.permissions:
                fg = accent6 if context.good else accent8

        if context.marked:
            attr |= bold
            fg = accent2

        if context.message:
            fg = accent3

        if context.in_taskview:
            fg = accent5

        return fg, bg, attr


#
# class CustomTheme(ColorScheme):
#     def use(self, context):
#         fg, bg, attr = default_colors
#
#         accent1 = 62  # Соответствует цвету #6363c4
#         accent2 = 61  # Соответствует цвету #5353ab
#         accent3 = 60  # Соответствует цвету #43438e
#         accent4 = 54  # Соответствует цвету #343457
#
#         if context.reset:
#             return default_colors
#
#         if context.in_browser:
#             if context.selected:
#                 attr = reverse
#             if context.directory:
#                 fg = accent1
#             elif context.executable and not context.directory:
#                 fg = accent2
#             else:
#                 fg = accent4
#
#         if context.in_titlebar:
#             attr |= bold
#             fg = accent1
#
#         if context.in_statusbar:
#             if context.permissions:
#                 fg = accent2 if context.good else accent4
#
#         if context.marked:
#             attr |= bold
#             fg = accent3
#
#         if context.message:
#             fg = accent3
#
#         if context.in_taskview:
#             fg = accent1
#
#         return fg, bg, attr

