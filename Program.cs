using System;
using System.IO;
using System.Diagnostics;

// Caminho para pasta Apps
string pastaApps = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Apps");

if (!Directory.Exists(pastaApps))
{
    Directory.CreateDirectory(pastaApps);
    Console.WriteLine($"Pasta 'apps' criada. Adiciona as tuas pastas de programas/jogos nela e tentar novemente");
    return;    
}

// Procura todas as subpastas dentro de 'Apps'
string[] pastasEncontradas = Directory.GetDirectories(pastaApps);

if (pastasEncontradas.Length == 0)
{
    Console.WriteLine($"Nenhum App encontrado dentro sa pasta 'Apps'.");
    return;
}

//faz uma lista de opições no console
Console.WriteLine($"=== FLARE - Launcher ===");
for (int i = 0; i < pastasEncontradas.Length; i++)
{
    string nomePasta = Path.GetFileName(pastasEncontradas[i]);
    Console.WriteLine($"[{i + 1}] {nomePasta}");
    
}

//vai perguntar 'qual app abrir'
Console.WriteLine($"\nDiritar Numero do App que você quer abrir: ");
string entrada = Console.ReadLine();

if (int.TryParse(entrada, out int opcao) && opcao >= 1 && opcao <= pastasEncontradas.Length)
{
    string pastaSelecionada = pastasEncontradas[opcao - 1];
    string caminhoExe = Path.Combine(pastaSelecionada, "APP.exe");

    if (File.Exists(caminhoExe))
    {
        //executa o app selecionado
        ProcessStartInfo info = new ProcessStartInfo
        {
            FileName = caminhoExe,
            WorkingDirectory = pastaSelecionada
        };

        Process.Start(info);
        Console.WriteLine("Abrindo...");
        Console.ReadLine();
        
    }

    else
    {
        Console.WriteLine($"Erro: não foi encontrada o ficheiro 'APP.exe' nessa pasta.");
        Console.ReadLine();
        
    }
}

else
{
    Console.WriteLine($"Essa Opição não existe!");
    Console.ReadLine();
    
}