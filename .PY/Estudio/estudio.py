import tkinter as tk
import os

root = tk.Tk()
root.title("Guia")
root.geometry("640x480")
root.maxsize(1280, 720)
root.minsize(500, 300)
root.config(bg="purple")


etiqueta = tk.Label(root, text="Hola, bienvenido a la guia de estudio, ¿Por donde empezamos?", fg="brown", bg="black")
etiqueta.pack(pady="20")


def mostrar_html():
    etiqueta.destroy()
    boton.destroy()
    root.config(bg="orange")
    text = tk.Label(root, text="Aca aparecera todo lo que has aprendido de HTML", font=("Arial", 14), fg="white", bg="black")
    text.pack(pady=20)
    # Crear el botón para mostrar texto solo después de mostrar HTML
    boton1 = tk.Button(root, text="Motrar texto", command=lambda: HTML(boton1, boton2))
    boton1.pack(pady=10)
    # Crear el botón para abrir archivo solo después de mostrar HTML
    boton2 = tk.Button(root, text="Abrir archivo", command=archivo)
    boton2.pack(pady=10)

boton = tk.Button(root, text="HTML", command=mostrar_html, font=("Arial", 14, "bold"), fg="white", bg="black", border=5, relief="raised")
boton.pack(pady=10)

def HTML(boton1, boton2):
    text1 = tk.Label(root, text="Lo mas avanzado hoy es la pagina de The New Life verificar pagina o abrir archivo de estudio", font=("Arial", 10))
    boton1.config(state="disabled")
    boton2.config(state="normal")
    text1.pack(pady=20)




def archivo():
    os.startfile(r"C:\Users\Lorenzo\Documents\God Page")
root.mainloop()