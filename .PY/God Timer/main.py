import tkinter as tk
import os
import time
import threading
from PIL import Image, ImageDraw
import pystray

root = tk.Tk()
root.title("God Timer")
root.geometry("640x480")
root.minsize(320, 240)

label = tk.Label(root, text="Bienvenido a God Timer", anchor="center", justify="center")
label.pack()

inicio = time.time()

def actualizar_cronometro():
    tiempo_pasado = int(time.time() - inicio)
    horas = tiempo_pasado // 3600
    minutos = (tiempo_pasado % 3600) // 60
    segundos = tiempo_pasado % 60
    reloj_label.config(text=f"{horas:02d}:{minutos:02d}:{segundos:02d}")
    root.after(1000, actualizar_cronometro)

reloj_label = tk.Label(root, font=("Arial", 40), anchor="center", justify="center")
reloj_label.pack(pady=20)

def mostrar_ventana(icon, item):
    icon.stop()
    root.after(0, root.deiconify)

def ocultar_ventana():
    root.withdraw()
    mostrar_icono_bandeja()

def crear_icono():
    # Crea un icono simple (círculo azul)
    image = Image.new('RGB', (64, 64), color=(0, 0, 0, 0))
    draw = ImageDraw.Draw(image)
    draw.ellipse((16, 16, 48, 48), fill='blue')
    return image

def mostrar_icono_bandeja():
    icon = pystray.Icon(
        "God Timer",
        crear_icono(),
        "God Timer",
        menu=pystray.Menu(
            pystray.MenuItem("Mostrar", lambda icon, item: mostrar_ventana(icon, item)),
            pystray.MenuItem("Salir", lambda icon, item: salir(icon))
        )
    )
    threading.Thread(target=icon.run, daemon=True).start()

def salir(icon):
    icon.stop()
    root.quit()

root.protocol("WM_DELETE_WINDOW", ocultar_ventana)

actualizar_cronometro()
root.mainloop()
