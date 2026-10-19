extends Control

@onready var lista_de_apps = $MarginContainer/VBoxContainer/ScrollContainer/GridContainer

func _ready() -> void:
	carregar_aplicativos()
	
func carregar_aplicativos() -> void:
	for child in lista_de_apps.get_children():
		child.queue_free()
	
	var caminho_base = OS.get_executable_path().get_base_dir()
	var pasta_apps = caminho_base + "/Apps"
	
	if OS.has_feature("editor"):
		pasta_apps = ProjectSettings.globalize_path("res://Apps")
		
	if not DirAccess.dir_exists_absolute(pasta_apps):
		DirAccess.make_dir_recursive_absolute(pasta_apps)
		print("Pasta 'Apps' criada em: ", pasta_apps)
		return
	
	var dir = DirAccess.open(pasta_apps)
	if dir:
		dir.list_dir_begin()
		var nome_pasta = dir.get_next()
		
		while nome_pasta != "":
			if dir.current_is_dir() and not nome_pasta.begins_with("."):
				var caminho_app = pasta_apps + "/" + nome_pasta
				verificar_e_adicionar_app(caminho_app, nome_pasta)
			nome_pasta = dir.get_next()
			
func verificar_e_adicionar_app(caminho_pasta: String, nome_pasta: String) -> void:
	var caminho_exe = caminho_pasta + "/APP.exe"
	var caminho_img = caminho_pasta + "/img.png"
	
	if FileAccess.file_exists(caminho_exe):
		criar_card_app(nome_pasta, caminho_exe, caminho_img, caminho_pasta)
		
func criar_card_app(nome: String, exe_path: String, img_path: String, work_dir: String) -> void:
	var botao = Button.new()
	botao.text = " " + nome
	botao.custom_minimum_size = Vector2(200, 60)
	botao.alignment = HORIZONTAL_ALIGNMENT_LEFT
	
	if FileAccess.file_exists(img_path):
		var imagem = Image.load_from_file(img_path)
		if  imagem:
			var textura = ImageTexture.create_from_image(imagem)
			botao.icon = textura
			botao.expand_icon = true
	
	botao.pressed.connect(func(): rodar_app(exe_path, work_dir))
	
	lista_de_apps.add_child(botao)
	
func rodar_app(exe_path: String, work_path: String) -> void:
	print("Iniciando: ", exe_path)
	
	var pid = OS.create_process(exe_path, [], false)
	if pid == -1:
		print("Error ao tentar abrir app")
