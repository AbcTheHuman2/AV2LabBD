package model;

public class Pais
{
	private char[] codigo = new char[3];
	private String nome;
	
	public char[] getCodigo()
	{
		return codigo;
	}
	
	public void setCodigo(char[] codigo)
	{
		this.codigo = codigo;
	}
	
	public String getNome()
	{
		return nome;
	}
	
	public void setNome(String nome)
	{
		this.nome = nome;
	}
}
