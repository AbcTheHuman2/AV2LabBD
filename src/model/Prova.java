package model;

public class Prova
{
	private int id;
	private String nome;
	private boolean sexo;
	
	public int getId()
	{
		return id;
	}
	
	public void setId(int id)
	{
		this.id = id;
	}
	
	public String getNome()
	{
		return nome;
	}
	
	public void setNome(String nome)
	{
		this.nome = nome;
	}
	
	public boolean isMasculino()
	{
		return sexo;
	}
	
	public void setSexo(boolean sexo)
	{
		this.sexo = sexo;
	}
}