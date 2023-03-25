/// so acontece quando o inimigo for destruido - destroi a bola tbm
if instance_exists(bulletInst) && bulletInst.state == 0
{
	bulletInst.destroy = true;
}
